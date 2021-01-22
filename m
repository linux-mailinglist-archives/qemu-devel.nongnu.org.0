Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38937300948
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:09:42 +0100 (CET)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zwK-0001Kw-JK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2zoJ-0003Zh-1o
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:01:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2zo2-0003oX-G6
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611334863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/c/qw8uE0nXPJTTQhisM1KFoUSH++Wsj00vAFzmFgY=;
 b=iJbL6H8EEf7V0RLffI+wVv0COPE5C8tG+CjBxp7hKxQV5XccJNGCYPIQ0F7qBCmMcT0i24
 4D26ID6jliVd5vOCOgCxIYaF6oxEfPLtTjrGhTPmUjTjbljg7qKi05artVJ5X3Tvrj2q+3
 YGbHiEB8HN+Artav9aqgb1ar0LowdXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-F9Wao0IGPz6cytTH3rbMDw-1; Fri, 22 Jan 2021 12:01:00 -0500
X-MC-Unique: F9Wao0IGPz6cytTH3rbMDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2C01800D41;
 Fri, 22 Jan 2021 17:00:59 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE886B540;
 Fri, 22 Jan 2021 17:00:55 +0000 (UTC)
Subject: Re: [PATCH v4 14/16] block/io: support int64_t bytes in
 bdrv_co_p{read,write}v_part()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <20201211183934.169161-15-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a26d4c7b-13b9-704a-7eeb-6661e4b2c24c@redhat.com>
Date: Fri, 22 Jan 2021 11:00:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211183934.169161-15-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, prepare bdrv_co_preadv_part() and bdrv_co_pwritev_part() and their
> remaining dependencies now.
> 
> bdrv_pad_request() is updated simultaneously, as pointer to bytes passed
> to it both from bdrv_co_pwritev_part() and bdrv_co_preadv_part().
> 
> So, all callers of bdrv_pad_request() are updated to pass 64bit bytes.
> bdrv_pad_request() is already good for 64bit requests, add
> corresponding assertion.
> 
> Look at bdrv_co_preadv_part() and bdrv_co_pwritev_part().
> Type is widening, so callers are safe. Let's look inside the functions.
> 
> In bdrv_co_preadv_part() and bdrv_aligned_pwritev() we only pass bytes
> to other already int64_t interfaces (and some obviously safe
> calculations), it's OK.
> 
> In bdrv_co_do_zero_pwritev() aligned_bytes may become large now, still
> it's passed to bdrv_aligned_pwritev which supports int64_t bytes.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h |  4 ++--
>  block/io.c                | 14 ++++++++------
>  block/trace-events        |  4 ++--
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 

> @@ -1745,7 +1747,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
>      BdrvRequestPadding pad;
>      int ret;
>  
> -    trace_bdrv_co_preadv(bs, offset, bytes, flags);
> +    trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
>  

> @@ -2173,7 +2175,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
>      int ret;
>      bool padded = false;
>  
> -    trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);
> +    trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);

The change in trace names makes sense, but isn't specifically called out
in the commit message.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


