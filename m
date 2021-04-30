Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A336F848
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:06:26 +0200 (CEST)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQ2T-0005EQ-Ha
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcQ0e-00049q-Fg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcQ0Y-0008Qs-R1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619777065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qi/wgJzQyVzvvcCZtwD7MCOLuRAX0OD0K/6R2VJaXM8=;
 b=BQobhuazzeTB2nzI0j1coujyaHaZdK0LMn4Z/kaQBoeBAK7uw4pMvAHaqEjbWQWoIfpPEa
 Du1qAzRl9CZ96C17WqRAKKSrvZ/kafMQScX19l6XbGO8mWTr2nRFICndUPSaI6Adglg/Mg
 jpzl9XL58FqAgleac3oytC16Mz1zTYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-R3DTLQdsP0SX2gEmnVtr-g-1; Fri, 30 Apr 2021 06:04:24 -0400
X-MC-Unique: R3DTLQdsP0SX2gEmnVtr-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6A826DD2A;
 Fri, 30 Apr 2021 10:04:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 803EF421F;
 Fri, 30 Apr 2021 10:04:17 +0000 (UTC)
Subject: Re: [PATCH] block: simplify write-threshold and drop write notifiers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210421220950.105017-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8496a111-5721-923d-2e82-920f2e77233a@redhat.com>
Date: Fri, 30 Apr 2021 12:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421220950.105017-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 00:09, Vladimir Sementsov-Ogievskiy wrote:
> write-notifiers are used only for write-threshold. New code for such
> purpose should create filters.
> 
> Let's handle write-threshold simply in generic code and drop write
> notifiers at all.
> 
> Also move part of write-threshold API that is used only for testing to
> the test.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> I agree that this could be split into 2-3 parts and not combining
> everything into one. But I'm tired now.

Er...  You should have put it off until the next day then? O:)

It should be multiple patches.  At least one to move the write threshold 
update to block/io.c, and then another to drop write notifiers.

> I can send v2 if needed, so
> consider it as RFC. Or take as is if you think it's not too much-in-one.
> 
> I also suggest this as a prepartion (and partly substitution) for
> "[PATCH v2 0/8] Block layer thread-safety, continued"
> 
>   include/block/block_int.h         | 12 -----
>   include/block/write-threshold.h   | 24 ---------
>   block.c                           |  1 -
>   block/io.c                        | 21 +++++---
>   block/write-threshold.c           | 87 ++-----------------------------
>   tests/unit/test-write-threshold.c | 38 ++++++++++++++
>   6 files changed, 54 insertions(+), 129 deletions(-)

[...]

> diff --git a/block/io.c b/block/io.c
> index ca2dca3007..e0aa775952 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -36,6 +36,8 @@
>   #include "qemu/main-loop.h"
>   #include "sysemu/replay.h"
>   
> +#include "qapi/qapi-events-block-core.h"
> +
>   /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
>   #define MAX_BOUNCE_BUFFER (32768 << BDRV_SECTOR_BITS)
>   
> @@ -1974,6 +1976,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>              child->perm & BLK_PERM_RESIZE);
>   
>       switch (req->type) {
> +        uint64_t write_threshold;
> +

Works, but I think this is the first time I see a variable declared in a 
switch block.  What I usually do for such cases is to put a block after 
the label.  (i.e. case X: { uint64_t write_threshold; ... })

But it wouldn’t hurt to just declare this at the beginning of 
bdrv_co_write_req_prepare(), I think.

>       case BDRV_TRACKED_WRITE:
>       case BDRV_TRACKED_DISCARD:
>           if (flags & BDRV_REQ_WRITE_UNCHANGED) {
> @@ -1981,8 +1985,15 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>           } else {
>               assert(child->perm & BLK_PERM_WRITE);
>           }
> -        return notifier_with_return_list_notify(&bs->before_write_notifiers,
> -                                                req);
> +        write_threshold = qatomic_read(&bs->write_threshold_offset);
> +        if (write_threshold > 0 && offset + bytes > write_threshold) {
> +            qapi_event_send_block_write_threshold(
> +                bs->node_name,
> +                offset + bytes - write_threshold,
> +                write_threshold);
> +            qatomic_set(&bs->write_threshold_offset, 0);
> +        }

I’d put all of this into a function in block/write-threshold.c that’s 
called from here.

Max

> +        return 0;
>       case BDRV_TRACKED_TRUNCATE:
>           assert(child->perm & BLK_PERM_RESIZE);
>           return 0;
> @@ -3137,12 +3148,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
>       return true;
>   }
>   
> -void bdrv_add_before_write_notifier(BlockDriverState *bs,
> -                                    NotifierWithReturn *notifier)
> -{
> -    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
> -}
> -
>   void bdrv_io_plug(BlockDriverState *bs)
>   {
>       BdrvChild *child;


