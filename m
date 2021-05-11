Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7537AC85
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:59:12 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVix-00081x-9g
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVfn-0002ly-EJ; Tue, 11 May 2021 12:55:55 -0400
Received: from relay.sw.ru ([185.231.240.75]:35606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVfl-00058q-Rr; Tue, 11 May 2021 12:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:From:
 Subject; bh=jStKnK9jpz1//Gm7QIVOFmfiNZOSnVdloP9rzLn4M/0=; b=fwooRuH7PrYze9aGa
 JkNWVEs2w0WpdltZZgBcChBeRaEtiPVChvTGTUD6MM0IOtq1k87CEL9nRHFhvQg4b5gTdNcFkH2FI
 1g39BvGk3VJWTUPnbawviuFCcXIAOyo9RyZPNy/hjrrLvWm7401fp/0m+HCiNJT1GtNaUeEQvjk58
 =;
Received: from [192.168.15.129] by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <ktkhai@virtuozzo.com>)
 id 1lgVfa-0027mI-JT; Tue, 11 May 2021 19:55:42 +0300
Subject: Re: [PATCH v2 09/10] qcow2-refcount: check_refcounts_l1(): check
 reserved bits
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, eblake@redhat.com, berto@igalia.com
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
 <20210505065955.13964-10-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <5bf37795-f905-66bb-518e-a899c27dbb2c@virtuozzo.com>
Date: Tue, 11 May 2021 19:55:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505065955.13964-10-vsementsov@virtuozzo.com>
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
>  block/qcow2.h          | 1 +
>  block/qcow2-refcount.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index b8b1093b61..58fd7f1678 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -586,6 +586,7 @@ typedef enum QCow2MetadataOverlap {
>      (QCOW2_OL_CACHED | QCOW2_OL_INACTIVE_L2)
>  
>  #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
> +#define L1E_RESERVED_MASK 0x7f000000000001ffULL
>  #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
>  #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
>  
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 69294a94fe..15c4f6b075 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1904,6 +1904,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
>              continue;
>          }
>  
> +        if (l1_table[i] & L1E_RESERVED_MASK) {
> +            fprintf(stderr, "ERROR found L1 entry with reserved bits set: "
> +                    "%" PRIx64, l1_table[i]);

'\n' is missed.

The rest is OK for me.

Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>

> +            res->corruptions++;
> +        }
> +
>          l2_offset = l1_table[i] & L1E_OFFSET_MASK;
>  
>          /* Mark L2 table as used */
> 


