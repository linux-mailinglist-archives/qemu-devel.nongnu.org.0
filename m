Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF04CCB92
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 03:12:16 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPxQV-0006nT-3Q
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 21:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiangdong5@huawei.com>)
 id 1nPxPf-00066l-JN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:11:23 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiangdong5@huawei.com>)
 id 1nPxPc-0000Sa-Ki
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:11:23 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K8rsB1h30zdZLT;
 Fri,  4 Mar 2022 10:09:50 +0800 (CST)
Received: from dggpeml500013.china.huawei.com (7.185.36.41) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:11:08 +0800
Received: from [10.174.187.161] (10.174.187.161) by
 dggpeml500013.china.huawei.com (7.185.36.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:11:07 +0800
Subject: Re: [PATCH v4 08/14] util: Add iova_tree_alloc_map
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20220303185147.3605350-1-eperezma@redhat.com>
 <20220303185147.3605350-9-eperezma@redhat.com>
CC: Stefano Garzarella <sgarzare@redhat.com>, Zhu Lingshan
 <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Eric Blake
 <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu
 <lulu@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, "Fangyi
 (Eric)" <eric.fangyi@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>, Gautam Dawar
 <gdawar@xilinx.com>, <virtualization@lists.linux-foundation.org>, Peter Xu
 <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, <yebiaoxiang@huawei.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, "Parav Pandit" <parav@mellanox.com>, Xiao W Wang
 <xiao.w.wang@intel.com>, "Markus Armbruster" <armbru@redhat.com>
Message-ID: <62217530.9030309@huawei.com>
Date: Fri, 4 Mar 2022 10:10:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20220303185147.3605350-9-eperezma@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.161]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpeml500013.china.huawei.com (7.185.36.41)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liuxiangdong5@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Liuxiangdong <liuxiangdong5@huawei.com>
From:  Liuxiangdong via <qemu-devel@nongnu.org>



On 2022/3/4 2:51, Eugenio Pérez wrote:
> This iova tree function allows it to look for a hole in allocated
> regions and return a totally new translation for a given translated
> address.
>
> It's usage is mainly to allow devices to access qemu address space,
> remapping guest's one into a new iova space where qemu can add chunks of
> addresses.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>   include/qemu/iova-tree.h |  18 ++++++
>   util/iova-tree.c         | 135 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 153 insertions(+)
>
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index 8249edd764..d066400f09 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -29,6 +29,7 @@
>   #define  IOVA_OK           (0)
>   #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
>   #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
> +#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
>   
>   typedef struct IOVATree IOVATree;
>   typedef struct DMAMap {
> @@ -119,6 +120,23 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
>    */
>   void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
>   
> +/**
> + * iova_tree_alloc_map:
> + *
> + * @tree: the iova tree to allocate from
> + * @map: the new map (as translated addr & size) to allocate in the iova region
> + * @iova_begin: the minimum address of the allocation
> + * @iova_end: the maximum addressable direction of the allocation
> + *
> + * Allocates a new region of a given size, between iova_min and iova_max.
> + *
> + * Return: Same as iova_tree_insert, but cannot overlap and can return error if
> + * iova tree is out of free contiguous range. The caller gets the assigned iova
> + * in map->iova.
> + */
> +int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                        hwaddr iova_end);
> +
>   /**
>    * iova_tree_destroy:
>    *
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 23ea35b7a4..3160c50d3b 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -16,6 +16,39 @@ struct IOVATree {
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
> +    /* Map at the left of the hole, can be NULL if "this" is first one */
> +    const DMAMap *prev;
> +
> +    /* Map at the right of the hole, can be NULL if "prev" is the last one */
> +    const DMAMap *this;
> +
> +    /* If found, we fill in the IOVA here */
> +    hwaddr iova_result;
> +
> +    /* Whether have we found a valid IOVA */
> +    bool iova_found;
> +};
> +
> +/**
> + * Iterate args to the next hole
> + *
> + * @args: The alloc arguments
> + * @next: The next mapping in the tree. Can be NULL to signal the last one
> + */
> +static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *args,
> +                                         const DMAMap *next) {
> +    args->prev = args->this;
> +    args->this = next;
> +}
> +
>   static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
>   {
>       const DMAMap *m1 = a, *m2 = b;
> @@ -107,6 +140,108 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
>       return IOVA_OK;
>   }
>   
> +/**
> + * Try to find an unallocated IOVA range between prev and this elements.
> + *
> + * @args: Arguments to allocation
> + *
> + * Cases:
> + *
> + * (1) !prev, !this: No entries allocated, always succeed
> + *
> + * (2) !prev, this: We're iterating at the 1st element.
> + *
> + * (3) prev, !this: We're iterating at the last element.
> + *
> + * (4) prev, this: this is the most common case, we'll try to find a hole
> + * between "prev" and "this" mapping.
> + *
> + * Note that this function assumes the last valid iova is HWADDR_MAX, but it
> + * searches linearly so it's easy to discard the result if it's not the case.
> + */
> +static void iova_tree_alloc_map_in_hole(struct IOVATreeAllocArgs *args)
> +{
> +    const DMAMap *prev = args->prev, *this = args->this;
> +    uint64_t hole_start, hole_last;
> +
> +    if (this && this->iova + this->size < args->iova_begin) {
> +        return;
> +    }
> +

Hi, Eugenio.
Is there such a condition that

args->iova_begin > this->iova  and
args->iova_begin < this->iova + this->size


Thanks！
Xiangdong Liu


> +    hole_start = MAX(prev ? prev->iova + prev->size + 1 : 0, args->iova_begin);
> +    hole_last = this ? this->iova : HWADDR_MAX;
> +
> +    if (hole_last - hole_start > args->new_size) {
> +        args->iova_result = hole_start;
> +        args->iova_found = true;
> +    }
> +}
> +
> +/**
> + * Foreach dma node in the tree, compare if there is a hole with its previous
> + * node (or minimum iova address allowed) and the node.
> + *
> + * @key: Node iterating
> + * @value: Node iterating
> + * @pargs: Struct to communicate with the outside world
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
> +    iova_tree_alloc_map_in_hole(args);
> +    return args->iova_found;
> +}
> +
> +int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                        hwaddr iova_last)
> +{
> +    struct IOVATreeAllocArgs args = {
> +        .new_size = map->size,
> +        .iova_begin = iova_begin,
> +    };
> +
> +    if (unlikely(iova_last < iova_begin)) {
> +        return IOVA_ERR_INVALID;
> +    }
> +
> +    /*
> +     * Find a valid hole for the mapping
> +     *
> +     * Assuming low iova_begin, so no need to do a binary search to
> +     * locate the first node.
> +     *
> +     * TODO: Replace all this with g_tree_node_first/next/last when available
> +     * (from glib since 2.68). To do it with g_tree_foreach complicates the
> +     * code a lot.
> +     *
> +     */
> +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> +    if (!args.iova_found) {
> +        /*
> +         * Either tree is empty or the last hole is still not checked.
> +         * g_tree_foreach does not compare (last, iova_last] range, so we check
> +         * it here.
> +         */
> +        iova_tree_alloc_args_iterate(&args, NULL);
> +        iova_tree_alloc_map_in_hole(&args);
> +    }
> +
> +    if (!args.iova_found || args.iova_result + map->size > iova_last) {
> +        return IOVA_ERR_NOMEM;
> +    }
> +
> +    map->iova = args.iova_result;
> +    return iova_tree_insert(tree, map);
> +}
> +
>   void iova_tree_destroy(IOVATree *tree)
>   {
>       g_tree_destroy(tree->tree);


