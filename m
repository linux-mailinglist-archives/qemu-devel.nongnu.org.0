Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C93A31F7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:23:33 +0200 (CEST)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOOy-0005Sj-C7
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrONm-0004T0-SZ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrONi-00032W-R3
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623345733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hoUDABMAu8B6vmjK8RyAOdl4iWmj7RB/XBcqOadB8w=;
 b=MtoG/JGzrFXb7a8VKLSQC079rJ4EErQR20aKjtPzBnOu8qWtEKuxC9ijuyelp0ZJrTILzl
 SeYfbMyXrfPNslkNiX7VE7CjEk/+692AMZ1yyPrC/rGG5sSN/dLtLvvrh0dYHy/394o9ao
 s5hfI7UnvFSKKgJhYJI7itYIXKSihws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-UXjB0c6_MBCY8VObWFjD2A-1; Thu, 10 Jun 2021 13:22:11 -0400
X-MC-Unique: UXjB0c6_MBCY8VObWFjD2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7309E8027F4;
 Thu, 10 Jun 2021 17:22:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B5D05C1CF;
 Thu, 10 Jun 2021 17:22:06 +0000 (UTC)
Date: Thu, 10 Jun 2021 12:22:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 01/32] co-queue: drop extra coroutine_fn marks
Message-ID: <20210610172204.w2gtdeoj3v72m5rg@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610100802.5888-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 01:07:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> qemu_co_queue_next() and qemu_co_queue_restart_all() just call
> aio_co_wake() which works well in non-coroutine context. So these
> functions can be called from non-coroutine context as well. And
> actually qemu_co_queue_restart_all() is called from
> nbd_cancel_in_flight(), which is called from non-coroutine context.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/coroutine.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

In the back of my mind, I have to repeatedly question my faulty memory
on whether:

absence of coroutine_fn means this function is unsafe to call from a
coroutine context (that is, coroutines can only call functions tagged
with coroutine_fn)

vs.

presence of coroutine_fn means this function must only use
coroutine-safe actions, but not all coroutine-safe functions have this
tag (in particular, functions which are designed to work both in or
out of coroutine context do not have the tag, but coroutines can call
functions without the tag)

But thankfully, rereading include/qemu/coroutine.h clears it up and
both of my initial thoughts are wrong although the second is closer;
it is yet another definition:

presence of coroutine_fn means this function must NOT be called except
from a coroutine context.  coroutines can call functions with or
without the tag, but if they lack the tag, the coroutine must ensure
the function won't block.

Thus, adding the tag is something we do when writing a function that
obeys coroutine rules and requires a coroutine context to already be
present, and once a function is then relaxed enough to work from both
regular and coroutine functions, we drop the marker.  But we keep the
_co_ in the function name to remind ourselves that it is
coroutine-safe, in addition to normal-safe.

And your patch is doing just that - we have functions that work from
both normal and coroutine context, so we can drop the marker but keep
_co_ in the name.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


