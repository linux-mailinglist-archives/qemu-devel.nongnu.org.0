Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B581237AC65
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:51:02 +0200 (CEST)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVb3-0004Pi-BC
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVZd-0003Ek-NC; Tue, 11 May 2021 12:49:33 -0400
Received: from relay.sw.ru ([185.231.240.75]:59386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVZa-0001vq-9V; Tue, 11 May 2021 12:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:From:
 Subject; bh=vU51FdrovyHjJYmKSNc4zPJEC89wiiFiq7kjL2TMaR8=; b=jd+AoWzgyxBWmq8uW
 8B7g5zBtYX78u9S2J4sKUCSMNyOVp4S3Rskg1lQgCctaNYn71s+pZIlYqLEUHHidl0OYjdDciP2nr
 Htn7rDp0lkvHmpE0zktmG8JyMtEjaendf7pNl7cWEXBoi3pBK0IjxalxVT2hvgJpx2MgioHahclF0
 =;
Received: from [192.168.15.129] by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVZM-0027km-Uk; Tue, 11 May 2021 19:49:16 +0300
Subject: Re: [PATCH v2 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, eblake@redhat.com, berto@igalia.com
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
 <20210505065955.13964-7-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <be316573-90cc-f4e3-11ab-10f0354cd870@virtuozzo.com>
Date: Tue, 11 May 2021 19:49:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505065955.13964-7-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.231.240.75; envelope-from=ktkhai@virtuozzo.com;
 helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.05.2021 09:59, Vladimir Sementsov-Ogievskiy wrote:
> Check subcluster bitmap of the l2 entry for different types of
> clusters:
> 
>  - for compressed it must be zero
>  - for allocated check consistency of two parts of the bitmap
>  - for unallocated all subclusters should be unallocated
>    (or zero-plain)
> 
> For unallocated clusters we can safely fix the entry by making it
> zero-plain.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>

> ---
>  block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index f48c5e1b5d..062ec48a15 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>          uint64_t coffset;
>          int csize;
>          l2_entry = get_l2_entry(s, l2_table, i);
> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
>  
>          switch (qcow2_get_cluster_type(bs, l2_entry)) {
>          case QCOW2_CLUSTER_COMPRESSED:
> @@ -1700,6 +1701,14 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>                  break;
>              }
>  
> +            if (l2_bitmap) {
> +                fprintf(stderr, "ERROR compressed cluster %d with non-zero "
> +                        "subcluster allocation bitmap, entry=0x%" PRIx64 "\n",
> +                        i, l2_entry);
> +                res->corruptions++;
> +                break;
> +            }
> +
>              /* Mark cluster as used */
>              qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
>              ret = qcow2_inc_refcounts_imrt(
> @@ -1727,13 +1736,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>          {
>              uint64_t offset = l2_entry & L2E_OFFSET_MASK;
>  
> +            if ((l2_bitmap >> 32) & l2_bitmap) {
> +                res->corruptions++;
> +                fprintf(stderr, "ERROR offset=%" PRIx64 ": Allocated "
> +                        "cluster has corrupted subcluster allocation bitmap\n",
> +                        offset);
> +            }
> +
>              /* Correct offsets are cluster aligned */
>              if (offset_into_cluster(s, offset)) {
>                  bool contains_data;
>                  res->corruptions++;
>  
>                  if (has_subclusters(s)) {
> -                    uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
>                      contains_data = (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC);
>                  } else {
>                      contains_data = !(l2_entry & QCOW_OFLAG_ZERO);
> @@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>  
>          case QCOW2_CLUSTER_ZERO_PLAIN:
>          case QCOW2_CLUSTER_UNALLOCATED:
> +            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
> +                res->corruptions++;
> +                fprintf(stderr, "%s: Unallocated "
> +                        "cluster has non-zero subcluster allocation map\n",
> +                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
> +                if (fix & BDRV_FIX_ERRORS) {
> +                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
> +                                               active, &metadata_overlap);
> +                    if (metadata_overlap) {
> +                        return ret;
> +                    }
> +                }
> +            }
>              break;
>  
>          default:
> 


