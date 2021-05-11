Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8A37B0B9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:21:22 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZof-0003E7-Ey
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgZnO-0002UW-1B
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgZnM-0003E9-Bc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620767999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zz2TZoZAdE8VAeNTejy6giwfeJ55+u8GX7WefZDJhV8=;
 b=SzwC2gf5MvUrVTgKd4WsQ1tPrU3SM1mRZcPvERT4f/jMU1WS22iWLOZ/D9mqo7cBHc7Kfa
 6vPSHHjceenof6P7GX7fvi5m67gUkfmyNF9/Vcm+F6ECnEaE6UO+ayvBQsefD5/v2F+Q0v
 3zQ67iAMcXYpVu4CT0R1Uclr3sOt1hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-Dqf6T75pP5uXqNSruLaiRA-1; Tue, 11 May 2021 17:19:56 -0400
X-MC-Unique: Dqf6T75pP5uXqNSruLaiRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADA171854E24;
 Tue, 11 May 2021 21:19:54 +0000 (UTC)
Received: from [10.3.114.221] (ovpn-114-221.phx2.redhat.com [10.3.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 965FC2B198;
 Tue, 11 May 2021 21:19:46 +0000 (UTC)
Subject: Re: [PATCH v4 06/11] block: make BlockLimits::max_pwrite_zeroes 64bit
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-7-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <94bc702a-99a4-9a94-cf9b-6c67f4cf1fd2@redhat.com>
Date: Tue, 11 May 2021 16:19:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210324205132.464899-7-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, pavel.dovgaluk@ispras.ru, sw@weilnetz.de, pl@kamp.de,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 ronniesahlberg@gmail.com, pbonzini@redhat.com, namei.unix@gmail.com,
 dillaman@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to support 64 bit write-zeroes requests. Now update the
> limit variable. It's absolutely safe. The variable is set in some
> drivers, and used in bdrv_co_do_pwrite_zeroes().
> 
> Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
> that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
> remaining logic including num, offset and bytes variables is already
> supporting 64bit requests.
> 
> So the only thing that prevents 64 bit requests is limiting
> max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
> We'll drop this limitation after updating all block drivers.
> 
> Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
> will be modified to do bdrv_check_request() for write-zeroes path.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h | 7 +++----
>  block/io.c                | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

> +++ b/include/block/block_int.h
> @@ -676,10 +676,9 @@ typedef struct BlockLimits {
>       * that is set. May be 0 if bl.request_alignment is good enough */
>      uint32_t pdiscard_alignment;
>  
> -    /* Maximum number of bytes that can zeroized at once (since it is
> -     * signed, it must be < 2G, if set). Must be multiple of
> -     * pwrite_zeroes_alignment. May be 0 if no inherent 32-bit limit */
> -    int32_t max_pwrite_zeroes;
> +    /* Maximum number of bytes that can zeroized at once. Must be multiple of
> +     * pwrite_zeroes_alignment. May be 0 if no inherent 64-bit limit */

Is the comment still right?

Leaving as 0 is the easiest way for a driver to say "default limit", but
I would feel safer with the default being 2G-align rather than 63-bit
limit.  And it is a 63-bit limit, not 64-bit, if the driver opts in to
INT64_MAX.

> +    int64_t max_pwrite_zeroes;
>  
>      /* Optimal alignment for write zeroes requests in bytes. A power
>       * of 2 is best but not mandatory.  Must be a multiple of
> diff --git a/block/io.c b/block/io.c
> index 55095dd08e..79e600af27 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1836,7 +1836,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>      int head = 0;
>      int tail = 0;
>  
> -    int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
> +    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);

You are correct that for now we have no behavior change; a driver opting
in to a larger limit will still be clamped until we revisit this patch
later to drop the MIN() - but I agree with your approach of keeping
MIN() here until all drivers are audited.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


