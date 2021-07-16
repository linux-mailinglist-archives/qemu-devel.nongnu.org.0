Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1292A3CBE7A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 23:26:34 +0200 (CEST)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4VLs-0005qt-Km
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 17:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m4VKn-0004yD-Uy
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m4VKi-0004ei-D5
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626470718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VFOqcKZZYEVh/L+n4ZjEX8YZXbLBkwV+FDg544yaPMM=;
 b=J30+YJzzv3tkX7Mol3Y1SXfUMvxiFH8/rAz5p11nz2uJR3kAJX2Ww1CwgvhjfcXnckX+iO
 i4Wr9uuDcHNdr9ajj9ZMVYLnuK5cpaEOt6qToMds0Zpg4RQxqu9yho2WqhO/AqhRh2Nq2S
 byFSD1ufHmsuaDlvvgPWIStXFpvuvpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-J8EJ_a9xMxCu1_YjRLDaNg-1; Fri, 16 Jul 2021 17:25:16 -0400
X-MC-Unique: J8EJ_a9xMxCu1_YjRLDaNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F92019067E1;
 Fri, 16 Jul 2021 21:25:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E659B10027A5;
 Fri, 16 Jul 2021 21:25:14 +0000 (UTC)
Date: Fri, 16 Jul 2021 16:25:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 3/5] block/nbd: refactor nbd_recv_coroutines_wake_all()
Message-ID: <20210716212513.x5dtfslhgtyufx6x@redhat.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
 <20210714165916.102363-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210714165916.102363-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-611-bd111f
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 07:59:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Split out nbd_recv_coroutine_wake(), as it will be used in separate.

s/in separate/separately/

> Also add a possibility to wake only first found sleeping coroutine.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 

> +
> +static void nbd_recv_coroutines_wake_all(BDRVNBDState *s, bool only_one)

Without reading docs (including the parameter name), I would have guessed:

wake_all(s, true) - wakes all
wake_all(s, false) - wakes one

but your code does:

wake_all(s, true) - wakes one
wake_all(s, false) - wakes all

Maybe that means this function and/or its parameter is now misnamed.
Having the _all in the name with true to NOT be all is what threw me.
Would the following be any better:

nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)

where

wake(s, true) - wakes all
wake(s, false) - wakes one

and where your helper function needs to be renamed, and callers
updated to match those semantics?

>  {
>      int i;
>  
>      for (i = 0; i < MAX_NBD_REQUESTS; i++) {
> -        NBDClientRequest *req = &s->requests[i];
> -
> -        if (req->coroutine && req->receiving) {
> -            req->receiving = false;
> -            aio_co_wake(req->coroutine);
> +        if (nbd_recv_coroutine_wake(&s->requests[i]) && only_one) {
> +            return;

But while I'm not sold on the naming, the change in logic (to be able
to wake any one waiter but not the whole list) looks useful for future
patches.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


