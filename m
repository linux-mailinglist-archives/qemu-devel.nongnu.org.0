Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C07373B8D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:39:28 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGoJ-0003bL-EQ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leGmx-0002Oe-S7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leGmt-0000gS-OG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620218278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEfQroOalMcn+8rvSJLZzx1v7ZCUfwwTwTJytEDOzvc=;
 b=XbfzUN5K34oyoStFOh6y8L+LpeCydrqk090aC3jlWkVB4nq0RnxfJFKGXWCBUCR0K2joW6
 BhQHp8wt0gI4HBkCdPGByAcUs7oIbGaEFu/Kihbe31ix6OiaKNBlMgRBZCSl+VJei+PTJr
 p62Rg9fY1pmoYypE8cFjgTjzjR7e3Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-xD8T4rEcOySck1JJ_OPW7A-1; Wed, 05 May 2021 08:37:56 -0400
X-MC-Unique: xD8T4rEcOySck1JJ_OPW7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D2BC8049EF;
 Wed,  5 May 2021 12:37:55 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBB2C5D9C0;
 Wed,  5 May 2021 12:37:53 +0000 (UTC)
Subject: Re: [PATCH v2 1/9] block/write-threshold: don't use write notifiers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-2-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <712e9661-e296-b960-d6ca-9173f9ecb2f3@redhat.com>
Date: Wed, 5 May 2021 14:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504082553.20377-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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

On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
> write-notifiers are used only for write-threshold. New code for such
> purpose should create filters.
> 
> Let's better special-case write-threshold and drop write notifiers at
> all. (Actually, write-threshold is special-cased anyway, as the only
> user of write-notifiers)

Not noted here: That write-threshold.c is also reorganized.  (Doesn’t 
seem entirely necessary to do right in this patch, but why not.)

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block_int.h       |  1 -
>   include/block/write-threshold.h |  9 +++++
>   block/io.c                      |  5 ++-
>   block/write-threshold.c         | 68 +++++++--------------------------
>   4 files changed, 25 insertions(+), 58 deletions(-)

[...]

> diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
> index c646f267a4..7942dcc368 100644
> --- a/include/block/write-threshold.h
> +++ b/include/block/write-threshold.h
> @@ -59,4 +59,13 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
>   uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
>                                          const BdrvTrackedRequest *req);
>   
> +/*
> + * bdrv_write_threshold_check_write
> + *
> + * Check, does specified request exceeds write threshold. If it is, send

I’d prefer either “Check: Does the specified request exceed the write 
threshold?” or “Check whether the specified request exceeds the write 
threshold.”

> + * corresponding event and unset write threshold.

I’d call it “disable write threshold checking” instead of “unset write 
threshold”, because I don’t it immediately clear what unsetting the 
threshold means.

> + */
> +void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
> +                                      int64_t bytes);
> +
>   #endif

[...]

> @@ -122,3 +68,15 @@ void qmp_block_set_write_threshold(const char *node_name,
>   
>       aio_context_release(aio_context);
>   }
> +
> +void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
> +                                      int64_t bytes)
> +{
> +    int64_t end = offset + bytes;
> +    uint64_t wtr = bs->write_threshold_offset;
> +
> +    if (wtr > 0 && end > wtr) {
> +        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);

OK, don’t understand why bdrv_write_threshold_exceeded() had two cases 
(one for offset > wtr, one for end > wtr).  Perhaps overflow 
considerations?  Shouldn’t matter though.

> +        bdrv_write_threshold_set(bs, 0);

I’d keep the comment from before_write_notify() here (i.e. “autodisable 
to avoid flooding the monitor”).

But other than that, I have no complaints:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +    }
> +}
> 


