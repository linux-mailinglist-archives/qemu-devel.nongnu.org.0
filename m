Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308DD2D7DBF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:11:43 +0100 (CET)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmtK-0002O5-73
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knm6j-0000rR-PU
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knm6h-00070o-Df
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607707286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1a7jRgN6EDHHtr30+VpGBj0+vBVKrsLqKpbF+8gWhsA=;
 b=S3yZ+3l/3xaDhW9D7g3wNoRniKUaVAYMuE7vKAchTcHo1H1U6HS1AGPUwfcxGrrO4U1ND4
 e1kdsx7Lht2plB772OUH97TH3izUGNC5dyizxbSOTWPBdirTiBahjn4yxnKRQXsYIWwpoS
 KCBNiwabny2tGTATvA+H9oUW0vMdosg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-1Anh4zB0Oey-Ssnt0t2ObA-1; Fri, 11 Dec 2020 12:21:24 -0500
X-MC-Unique: 1Anh4zB0Oey-Ssnt0t2ObA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2CD180A09C;
 Fri, 11 Dec 2020 17:21:23 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C00E65F9B7;
 Fri, 11 Dec 2020 17:21:11 +0000 (UTC)
Subject: Re: [PATCH v14 13/13] block: apply COR-filter to block-stream jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-14-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6aa8bbb7-6745-eed3-ade6-3ef47d5ee08d@redhat.com>
Date: Fri, 11 Dec 2020 18:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-14-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> This patch completes the series with the COR-filter applied to
> block-stream operations.
> 
> Adding the filter makes it possible in future implement discarding
> copied regions in backing files during the block-stream job, to reduce
> the disk overuse (we need control on permissions).
> 
> Also, the filter now is smart enough to do copy-on-read with specified
> base, so we have benefit on guest reads even when doing block-stream of
> the part of the backing chain.
> 
> Several iotests are slightly modified due to filter insertion.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/stream.c             | 78 ++++++++++++++++++++++++++------------
>   tests/qemu-iotests/030     |  8 ++--
>   tests/qemu-iotests/141.out |  2 +-
>   tests/qemu-iotests/245     | 20 ++++++----
>   4 files changed, 72 insertions(+), 36 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index a7fd8945ad..b92f7de55b 100644
> --- a/block/stream.c
> +++ b/block/stream.c

[...]

> @@ -295,17 +287,49 @@ void stream_start(const char *job_id, BlockDriverState *bs,

[...]

> +    opts = qdict_new();
> +
> +    qdict_put_str(opts, "driver", "copy-on-read");
> +    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
> +    /* Pass the base_overlay node name as 'bottom' to COR driver */
> +    qdict_put_str(opts, "bottom", base_overlay->node_name);

Hm.  Should we set this option even if no base was specified?

On one hand, omitting this option would cor_co_preadv_part() a bit quicker.

On the other, what happens when you add a backing file below the bottom 
node during streaming (yes, a largely theoretical case)...  Now, all 
data from it is ignored.  That seemed a bit strange to me at first, but 
on second thought, it makes more sense.  Doing anything else would 
produce a garbage result basically, because stream_run() doesn’t take 
such a change into account.

So...  After all I think I agree with setting @bottom unconditionally.

And that’s the only comment I had. :)

Reviewed-by: Max Reitz <mreitz@redhat.com>


