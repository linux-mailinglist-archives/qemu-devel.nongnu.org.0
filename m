Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBDE37ACC8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:12:22 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVvh-0002rn-9y
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVt1-0001N9-5h; Tue, 11 May 2021 13:09:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:40416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVsy-0003YJ-Es; Tue, 11 May 2021 13:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:From:
 Subject; bh=mNYbtKzz7jcp841Z9dCAsnKf3QUUA9156kWnEVzPKEc=; b=ef8Xylbok/XKlqkjd
 Tm+S1sUn4/G5fTmdduzMKaKl2gY/B7YTNAdmtPunYbW+nZxtIR8FosN2uqcxXcZD1DxEi0Basi+jW
 hxa1fF3zmuApZp0jARgLMmLMC/f+nN/t5sVgwzkpy/sW3YuhnY18k3mzghkSyOsJsBwarxjJEuqsY
 =;
Received: from [192.168.15.129] by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVsn-0027oM-IO; Tue, 11 May 2021 20:09:21 +0300
Subject: Re: [PATCH v2 10/10] qcow2-refcount: check_refblocks(): add separate
 message for reserved
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, eblake@redhat.com, berto@igalia.com
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
 <20210505065955.13964-11-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <a1168389-2ebc-fcc8-178f-34e5e59e050e@virtuozzo.com>
Date: Tue, 11 May 2021 20:09:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505065955.13964-11-vsementsov@virtuozzo.com>
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
> Split checking for reserved bits out of aligned offset check.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>

> ---
>  block/qcow2.h          |  1 +
>  block/qcow2-refcount.c | 10 +++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index 58fd7f1678..fd48a89d45 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -591,6 +591,7 @@ typedef enum QCow2MetadataOverlap {
>  #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
>  
>  #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
> +#define REFT_RESERVED_MASK 0x1ffULL
>  
>  #define INV_OFFSET (-1ULL)
>  
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 15c4f6b075..472a7026db 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -2091,9 +2091,17 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
>  
>      for(i = 0; i < s->refcount_table_size; i++) {
>          uint64_t offset, cluster;
> -        offset = s->refcount_table[i];
> +        offset = s->refcount_table[i] & REFT_OFFSET_MASK;
>          cluster = offset >> s->cluster_bits;
>  
> +        if (s->refcount_table[i] & REFT_RESERVED_MASK) {
> +            fprintf(stderr, "ERROR refcount table entry %" PRId64 " has "
> +                    "reserved bits set\n", i);
> +            res->corruptions++;
> +            *rebuild = true;
> +            continue;
> +        }
> +
>          /* Refcount blocks are cluster aligned */
>          if (offset_into_cluster(s, offset)) {
>              fprintf(stderr, "ERROR refcount block %" PRId64 " is not "
> 


