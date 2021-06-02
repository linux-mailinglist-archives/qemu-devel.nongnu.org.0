Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD2399363
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:16:24 +0200 (CEST)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWLn-0007QJ-HD
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loWK2-0005yA-S0
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loWK0-0003Py-0p
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622661270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVSEGjmWDJ84RlybQS7MeiwLhntK7La+2Sfi2hkKLLw=;
 b=Iw1ArCWQfM6/q0zj8WXszYBNIybH2Gmka5OACXErWCliP2xJqM4zz0s3BKt3hX6pwyzKJx
 4vT3b2B5smahKu/j/AI1OVMrZ786UXsko8CgxW6mP4hgJcY42yTayDLxZN0b64k2qnkjjP
 dNMJLRf86kaxcm/kQ78zs6kaVJm3wwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-8G6-2ZuKOyWzF7Dns5cwAg-1; Wed, 02 Jun 2021 15:14:29 -0400
X-MC-Unique: 8G6-2ZuKOyWzF7Dns5cwAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82951801817;
 Wed,  2 Jun 2021 19:14:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C3960BE5;
 Wed,  2 Jun 2021 19:14:26 +0000 (UTC)
Date: Wed, 2 Jun 2021 14:14:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 09/33] block/nbd: bs-independent interface for
 nbd_co_establish_connection()
Message-ID: <20210602191425.lljb7anvjjjakpzr@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-10-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-10-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:47AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to split connection code to separate file. Now we are

to a separate

> ready to give nbd_co_establish_connection() clean and bs-independent
> interface.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  block/nbd.c | 49 +++++++++++++++++++++++++++++++------------------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 

> -static int coroutine_fn
> -nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
> +/*
> + * Get a new connection in context of @thr:
> + *   if thread is running, wait for completion

if the thread is running,...

> + *   if thread is already succeeded in background, and user didn't get the

if the thread already succeeded in the background,...

> + *     result, just return it now
> + *   otherwise if thread is not running, start a thread and wait for completion

otherwise, the thread is not running, so start...

> + */
> +static coroutine_fn QIOChannelSocket *
> +nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
>  {
> +    QIOChannelSocket *sioc = NULL;
>      QemuThread thread;
> -    BDRVNBDState *s = bs->opaque;
> -    NBDConnectThread *thr = s->connect_thread;
> -
> -    assert(!s->sioc);
>  
>      qemu_mutex_lock(&thr->mutex);
>  
> +    /*
> +     * Don't call nbd_co_establish_connection() in several coroutines in
> +     * parallel. Only one call at once is supported.
> +     */
> +    assert(!thr->wait_co);
> +
>      if (!thr->running) {
>          if (thr->sioc) {
>              /* Previous attempt finally succeeded in background */
> -            goto out;
> +            sioc = g_steal_pointer(&thr->sioc);
> +            qemu_mutex_unlock(&thr->mutex);

Worth using QEMU_LOCK_GUARD() here?

> +
> +            return sioc;
>          }
> +
>          thr->running = true;
>          error_free(thr->err);
>          thr->err = NULL;

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


