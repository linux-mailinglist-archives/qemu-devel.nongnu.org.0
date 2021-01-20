Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF22FDC89
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 23:26:33 +0100 (CET)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Lvs-00070I-Al
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 17:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Lu5-0005XO-Kz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 17:24:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Lu3-0002y6-3I
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 17:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611181478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EhEEVpeJ0k0j4TiWNnFVnusr0hlfuBzBFzC39D51eo=;
 b=ZQF4XOvxNUCIuUQvlaBvTDUpDddo59DYrZQyZp8gD3iUySyavM8InrH9lj6+QGjtVLXSiw
 EhhBWGt/89XC5KFZogLsBP4Q69cMXmog+4idS4ONT67+mJ7W3dy7a/HLDdEV9e133UW4pe
 CkMfgEpGtTiaouhQU+GDEHRFQZ/QRK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-xDOzmqpON9-iOtFivxqb4A-1; Wed, 20 Jan 2021 17:24:35 -0500
X-MC-Unique: xDOzmqpON9-iOtFivxqb4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3708A8144E8;
 Wed, 20 Jan 2021 22:24:34 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 004E95D9EF;
 Wed, 20 Jan 2021 22:24:32 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] block/nbd: move initial connect to coroutine
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
 <20201130134024.19212-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4a2d33f6-18ee-b8ff-a945-4ac6ce0406f4@redhat.com>
Date: Wed, 20 Jan 2021 16:24:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201130134024.19212-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 7:40 AM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to implement reconnect-on-open. Let's reuse existing
> reconnect loop. For this, do initial connect in connection coroutine.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 94 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 53 insertions(+), 41 deletions(-)
> 

> @@ -2279,6 +2268,29 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>      bdrv_inc_in_flight(bs);
>      aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
>  
> +    if (qemu_in_coroutine()) {
> +        s->open_co = qemu_coroutine_self();
> +        qemu_coroutine_yield();
> +    } else {
> +        BDRV_POLL_WHILE(bs, s->state == NBD_CLIENT_OPENING);
> +    }
> +
> +    if (s->state != NBD_CLIENT_CONNECTED && s->connect_status < 0) {
> +        /*
> +         * It's possible that state != NBD_CLIENT_CONNECTED, but connect_status
> +         * is 0. This means that initial connecting succeed, but failed later
> +         * (during BDRV_POLL_WHILE). It's a rare case, but it happen in iotest

This means that starting the initial connection succeeded, but we failed
later (during BDRV_POLL_WHILE).

happens

> +         * 83. Let's don't care and just report success in this case: it not
> +         * much differs from the case when connection failed immediately after
> +         * succeeded open.

We don't care, and just report success in this case, as it does not
change our behavior from the case when the connection fails right after
open succeeds.


> +         */
> +        assert(s->connect_err);
> +        error_propagate(errp, s->connect_err);
> +        s->connect_err = NULL;
> +        nbd_clear_bdrvstate(s);
> +        return s->connect_status;
> +    }
> +
>      return 0;
>  }
>  
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


