Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A991C442728
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:37:02 +0100 (CET)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhnPp-0006NP-Bd
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhnOH-0005eK-JM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhnOD-0006OS-TD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635834920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4e5jEhEQuanPUBKoekX0+VcpuIKOOFsqGpOTOqFUkMM=;
 b=fusI9whRz3QxAmLLSIN0dRXmgEtToOn6CZXD3gDMn7q0Ty8Z8a/4qWTOpQXbhORVMN6oQK
 clSolWXtIh46JSI6O7xBb5vd7jcxxyyrAOtcooH8NTKR1nyxcNJ91UGaeH3ItQdZmAQpqi
 re6pdGiQ194ieo2KI7fCPrF9stkjdtI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-YaH2qXVCPXGxzvqPhhs4lA-1; Tue, 02 Nov 2021 02:35:19 -0400
X-MC-Unique: YaH2qXVCPXGxzvqPhhs4lA-1
Received: by mail-pf1-f198.google.com with SMTP id
 w30-20020aa79a1e000000b0048012d2e882so5494311pfj.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 23:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4e5jEhEQuanPUBKoekX0+VcpuIKOOFsqGpOTOqFUkMM=;
 b=PVWa2pHSKT91Zgjg4GuCv626LIErlEP988MwIc3N2XMSrMrYe3//Gq58M5zfIreCce
 xD0svxNDu+gA+5IuDgLS024ZhlfLcHliDbW5y010TbClt4aYgIlq0U/hyufB4ZoUNJJk
 XlBZ9PaTSZe2IGqxsnM/oPLbbaiTXBpp5yYwNocs0wRMvGENyXI6jfZ/cQZjZO2h5f6S
 yUkGOa4y/KXV2RRBtfAuz4zeR6kUj7uwuVAi4b/q4aNk/pcoBpCh9eVHbeHuEDKA67vL
 7y+7sXNjNjC7+tA1Uq5VIMZmeijrVXmKgi5BUNa3YEh3qDTJJfEHbSiczvT03CXvzNNs
 v/cA==
X-Gm-Message-State: AOAM533VX4wTaS/Tua9J8I0303tz/4tVSTpxJytjRDDBfTLaHbH3rfzP
 1WEQnalpDNXt1AaduaelwveK2RSVm+URBdTJvr0binE655aVkkaYWcB86lLhUdlDzy5joGqJrIj
 W+wLzoNIvtIwZPEk=
X-Received: by 2002:a63:484c:: with SMTP id x12mr12604194pgk.220.1635834918418; 
 Mon, 01 Nov 2021 23:35:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1CpV/2EpS/e5nRLRk5cw0GVfgWPgQ4l1ZAtG77yfP9dNZTYAGAmmn1TSjbUPpUxycrBELkw==
X-Received: by 2002:a63:484c:: with SMTP id x12mr12604158pgk.220.1635834918018; 
 Mon, 01 Nov 2021 23:35:18 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y9sm1303706pjj.6.2021.11.01.23.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 23:35:17 -0700 (PDT)
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <86873f67-a2d0-7d4f-a2cf-8c4f32d9bd7f@redhat.com>
Date: Tue, 2 Nov 2021 14:35:06 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029183525.1776416-24-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/30 上午2:35, Eugenio Pérez 写道:
> This iova tree function allows it to look for a hole in allocated
> regions and return a totally new translation for a given translated
> address.
>
> It's usage is mainly to allow devices to access qemu address space,
> remapping guest's one into a new iova space where qemu can add chunks of
> addresses.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/qemu/iova-tree.h |  17 +++++
>   util/iova-tree.c         | 139 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 156 insertions(+)
>
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index 8249edd764..33f9b2e13f 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -29,6 +29,7 @@
>   #define  IOVA_OK           (0)
>   #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
>   #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
> +#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */


I think we need a better name other than "NOMEM", since it's actually 
means there's no sufficient hole for the range?


>   
>   typedef struct IOVATree IOVATree;
>   typedef struct DMAMap {
> @@ -119,6 +120,22 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
>    */
>   void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
>   
> +/**
> + * iova_tree_alloc:
> + *
> + * @tree: the iova tree to allocate from
> + * @map: the new map (as translated addr & size) to allocate in iova region
> + * @iova_begin: the minimum address of the allocation
> + * @iova_end: the maximum addressable direction of the allocation
> + *
> + * Allocates a new region of a given size, between iova_min and iova_max.
> + *
> + * Return: Same as iova_tree_insert, but cannot overlap and can be out of
> + * free contiguous range. Caller can get the assigned iova in map->iova.
> + */
> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                    hwaddr iova_end);
> +


"iova_tree_alloc_map" seems better.


>   /**
>    * iova_tree_destroy:
>    *
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 23ea35b7a4..27c921c4e2 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -16,6 +16,36 @@ struct IOVATree {
>       GTree *tree;
>   };
>   
> +/* Args to pass to iova_tree_alloc foreach function. */
> +struct IOVATreeAllocArgs {
> +    /* Size of the desired allocation */
> +    size_t new_size;
> +
> +    /* The minimum address allowed in the allocation */
> +    hwaddr iova_begin;
> +
> +    /* The last addressable allowed in the allocation */
> +    hwaddr iova_last;
> +
> +    /* Previously-to-last iterated map, can be NULL in the first node */
> +    const DMAMap *hole_left;
> +
> +    /* Last iterated map */
> +    const DMAMap *hole_right;


Any reason we can move those to IOVATree structure, it can simplify a 
lot of things.


> +};
> +
> +/**
> + * Iterate args to tne next hole
> + *
> + * @args  The alloc arguments
> + * @next  The next mapping in the tree. Can be NULL to signal the last one
> + */
> +static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *args,
> +                                         const DMAMap *next) {
> +    args->hole_left = args->hole_right;
> +    args->hole_right = next;
> +}
> +
>   static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
>   {
>       const DMAMap *m1 = a, *m2 = b;
> @@ -107,6 +137,115 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
>       return IOVA_OK;
>   }
>   
> +/**
> + * Try to accomodate a map of size ret->size in a hole between
> + * max(end(hole_left), iova_start).
> + *
> + * @args Arguments to allocation
> + */
> +static bool iova_tree_alloc_map_in_hole(const struct IOVATreeAllocArgs *args)
> +{
> +    const DMAMap *left = args->hole_left, *right = args->hole_right;
> +    uint64_t hole_start, hole_last;
> +
> +    if (right && right->iova + right->size < args->iova_begin) {
> +        return false;
> +    }
> +
> +    if (left && left->iova > args->iova_last) {
> +        return false;
> +    }
> +
> +    hole_start = MAX(left ? left->iova + left->size + 1 : 0, args->iova_begin);
> +    hole_last = MIN(right ? right->iova : HWADDR_MAX, args->iova_last);
> +
> +    if (hole_last - hole_start > args->new_size) {
> +        /* We found a valid hole. */
> +        return true;
> +    }
> +
> +    /* Keep iterating */
> +    return false;
> +}
> +
> +/**
> + * Foreach dma node in the tree, compare if there is a hole wit its previous
> + * node (or minimum iova address allowed) and the node.
> + *
> + * @key   Node iterating
> + * @value Node iterating
> + * @pargs Struct to communicate with the outside world
> + *
> + * Return: false to keep iterating, true if needs break.
> + */
> +static gboolean iova_tree_alloc_traverse(gpointer key, gpointer value,
> +                                         gpointer pargs)
> +{
> +    struct IOVATreeAllocArgs *args = pargs;
> +    DMAMap *node = value;
> +
> +    assert(key == value);
> +
> +    iova_tree_alloc_args_iterate(args, node);
> +    if (args->hole_left && args->hole_left->iova > args->iova_last) {
> +        return true;
> +    }
> +
> +    if (iova_tree_alloc_map_in_hole(args)) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                    hwaddr iova_last)
> +{
> +    struct IOVATreeAllocArgs args = {
> +        .new_size = map->size,
> +        .iova_begin = iova_begin,
> +        .iova_last = iova_last,
> +    };
> +
> +    if (iova_begin == 0) {
> +        /* Some devices does not like addr 0 */
> +        iova_begin += qemu_real_host_page_size;
> +    }
> +
> +    assert(iova_begin < iova_last);
> +
> +    /*
> +     * Find a valid hole for the mapping
> +     *
> +     * Assuming low iova_begin, so no need to do a binary search to
> +     * locate the first node.
> +     *
> +     * TODO: We can improve the search speed if we save the beginning and the
> +     * end of holes, so we don't iterate over the previous saved ones.
> +     *
> +     * TODO: Replace all this with g_tree_node_first/next/last when available
> +     * (from glib since 2.68). To do it with g_tree_foreach complicates the
> +     * code a lot.


To say the truth, the codes in iova_tree_alloc_traverse() is hard to be 
reviewed. I think it would be easy to use first/next/last. What we 
really need is to calculate the hole between two ranges with handmade 
first, last.

Thanks


> +     *
> +     */
> +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> +    if (!iova_tree_alloc_map_in_hole(&args)) {
> +        /*
> +         * 2nd try: Last iteration left args->right as the last DMAMap. But
> +         * (right, end) hole needs to be checked too
> +         */
> +        iova_tree_alloc_args_iterate(&args, NULL);
> +        if (!iova_tree_alloc_map_in_hole(&args)) {
> +            return IOVA_ERR_NOMEM;
> +        }
> +    }
> +
> +    map->iova = MAX(iova_begin,
> +                    args.hole_left ?
> +                    args.hole_left->iova + args.hole_left->size + 1 : 0);
> +    return iova_tree_insert(tree, map);
> +}
> +
>   void iova_tree_destroy(IOVATree *tree)
>   {
>       g_tree_destroy(tree->tree);


