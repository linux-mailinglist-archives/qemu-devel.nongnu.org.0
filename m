Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985CB2D7672
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:22:06 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniN3-0005k5-62
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kniLi-0005Ck-6v
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kniLe-0003O6-EU
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607692837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPMh8hBoCstldYW8rRT/4//OPL5NqllewJSVeJBdAEU=;
 b=alBNEPgHDel7ejK6/oQ4niitQmspoVjLAPeqLH5K6u3b7ScCQNr4hHNMvT8n+vcn6N3GQK
 BHzF4Q88BSU/oN6cEFDnVBJuu2+zSty1cLwoKJmBWlNR45RIBmAan8u4UxjF1K1JKpl+Ll
 fbz5cVPwu0FdvdHocKzXkaoOrioogVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-O8AZXva0NG-nF7CSHJ9Rjw-1; Fri, 11 Dec 2020 08:20:35 -0500
X-MC-Unique: O8AZXva0NG-nF7CSHJ9Rjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A569CC09;
 Fri, 11 Dec 2020 13:20:33 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC4B810013C0;
 Fri, 11 Dec 2020 13:20:27 +0000 (UTC)
Subject: Re: [PATCH v14 07/13] block: include supported_read_flags into BDS
 structure
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-8-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0fdb23ba-6690-f082-bad1-2839222eb688@redhat.com>
Date: Fri, 11 Dec 2020 14:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
> Add the new member supported_read_flags to the BlockDriverState
> structure. It will control the flags set for copy-on-read operations.
> Make the block generic layer evaluate supported read flags before they
> go to a block driver.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block_int.h |  4 ++++
>   block/io.c                | 12 ++++++++++--
>   2 files changed, 14 insertions(+), 2 deletions(-)

[...]

> diff --git a/block/io.c b/block/io.c
> index ec5e152bb7..e28b11c42b 100644
> --- a/block/io.c
> +++ b/block/io.c

[...]

> @@ -1426,9 +1429,13 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
>           goto out;
>       }
>   
> +    if (flags & ~bs->supported_read_flags) {
> +        abort();
> +    }

I’d prefer an assert(!(flags & ~bs->supported_read_flags)), so in case 
we do abort, there’s going to be an error message that immediately tells 
what the problem is.

Apart from that:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +
>       max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
>       if (bytes <= max_bytes && bytes <= max_transfer) {
> -        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, 0);
> +        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, flags);
>           goto out;
>       }


