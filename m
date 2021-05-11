Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E206537AC82
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:56:24 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVgG-0002Dd-0i
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVeP-0007y6-JQ; Tue, 11 May 2021 12:54:29 -0400
Received: from relay.sw.ru ([185.231.240.75]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVeJ-0004BI-Fp; Tue, 11 May 2021 12:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:From:
 Subject; bh=hVWZvl2rUMjURuoY68EXBwnvJTB6JL3Ginql6QPAkcA=; b=Xg2XidkCWFI4WN9kh
 7KRXyvQ/8hO7gsHnyGoqAIS4WKj49/mAHk6v2eNyWUmI1Zk/BS68+ANgs2aPF9yhoV4enLKN3zpWk
 xqWe+TUssqa1Tyq/DdP+Pu7CPRp+Iu05fiS+C7mXc1ktkQBAb5t0C//3h5SqCz+VHgu0tdpLeCxww
 =;
Received: from [192.168.15.129] by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVeA-0027lk-2i; Tue, 11 May 2021 19:54:14 +0300
Subject: Re: [PATCH v2 07/10] qcow2-refcount: check_refcounts_l2(): check
 reserved bits
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, eblake@redhat.com, berto@igalia.com
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
 <20210505065955.13964-8-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <64fdd6a2-231b-8425-ffe5-cc16aefe69f1@virtuozzo.com>
Date: Tue, 11 May 2021 19:54:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505065955.13964-8-vsementsov@virtuozzo.com>
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
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/qcow2.h          |  1 +
>  block/qcow2-refcount.c | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index c0e1e83796..b8b1093b61 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
>  
>  #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
>  #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
> +#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
>  
>  #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
>  
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 062ec48a15..47cc82449b 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>          int csize;
>          l2_entry = get_l2_entry(s, l2_table, i);
>          uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
> +        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);
>  
> -        switch (qcow2_get_cluster_type(bs, l2_entry)) {
> +        if (type != QCOW2_CLUSTER_COMPRESSED) {
> +            /* Check reserved bits of Standard Cluster Descriptor */
> +            if (l2_entry & L2E_STD_RESERVED_MASK) {
> +                fprintf(stderr, "ERROR found l2 entry with reserved bits set: "
> +                        "%" PRIx64, l2_entry);

'\n' is missed.

The rest is OK for me.

Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>

> +                res->corruptions++;
> +            }
> +        }
> +
> +        switch (type) {
>          case QCOW2_CLUSTER_COMPRESSED:
>              /* Compressed clusters don't have QCOW_OFLAG_COPIED */
>              if (l2_entry & QCOW_OFLAG_COPIED) {
> 


