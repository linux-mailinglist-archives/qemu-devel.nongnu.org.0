Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F12E0D41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:23:54 +0100 (CET)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krkS1-0003RW-Hi
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krkP3-00022m-Rd
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krkOu-00053o-RY
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608654038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oM4+8ij4+0WibpeMM4GioTnZAowDUrHC8zfOmt+ou4Q=;
 b=cZk7zgZd8qtiRxinqk1rgeaEWDzNVIqnCt/C5oUg4OLciFQHiP1TWbGNhjtA+XIvz/Sm/1
 lV/LrMUm9d9pz9Cp9EdCH+S49K7jfmbqz9ZxX/QZ7/fqWSB53AUgVVsAOpfJqjneEx4xcc
 aTIGR+joyv8QRHu8kzbmaSPLpm6YuS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-hkVMiZSnPy2HVlj5h9giEQ-1; Tue, 22 Dec 2020 11:20:35 -0500
X-MC-Unique: hkVMiZSnPy2HVlj5h9giEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A400BC7400;
 Tue, 22 Dec 2020 16:20:33 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-243.ams2.redhat.com
 [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F1BA60BF1;
 Tue, 22 Dec 2020 16:20:28 +0000 (UTC)
Subject: Re: [PATCH v15 13/13] block: apply COR-filter to block-stream jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-14-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <fa2c8c5e-78b5-6d4a-6e23-aaec2249debb@redhat.com>
Date: Tue, 22 Dec 2020 17:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216061703.70908-14-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
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
>   block/stream.c             | 105 ++++++++++++++++++++++---------------
>   tests/qemu-iotests/030     |   8 +--
>   tests/qemu-iotests/141.out |   2 +-
>   tests/qemu-iotests/245     |  20 ++++---
>   4 files changed, 80 insertions(+), 55 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 626dfa2b22..1fa742b0db 100644
> --- a/block/stream.c
> +++ b/block/stream.c

[...]

> @@ -266,30 +251,62 @@ void stream_start(const char *job_id, BlockDriverState *bs,

[...]

>       /* Make sure that the image is opened in read-write mode */
>       bs_read_only = bdrv_is_read_only(bs);
>       if (bs_read_only) {
> -        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
> -            bs_read_only = false;
> -            goto fail;
> +        int ret;
> +        /* Hold the chain during reopen */
> +        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
> +            return;
> +        }
> +
> +        ret = bdrv_reopen_set_read_only(bs, false, errp);
> +
> +        /* failure, or cor-filter will hold the chain */
> +        bdrv_unfreeze_backing_chain(bs, above_base);
> +
> +        if (ret < 0) {

Shouldn’t we keep the “bs_read_only = false;” here?

(All the rest of this patch looks good.)

Max

> +            return;
>           }
>       }


