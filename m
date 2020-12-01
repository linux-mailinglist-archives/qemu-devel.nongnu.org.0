Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA82CADCA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:53:44 +0100 (CET)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCed-000680-FJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkCbJ-0001k3-Pd
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:50:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkCbH-0001SR-UI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606855815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqJAMtEhB8BJwXxWEz5JcXa7vsShN3Thb4tz3IEAjIw=;
 b=A9yj9VNYd9YiKONcnKhEp/HNQhiTQrXfV6U6n62x4eJkJqjxBM8wRW242+PaYuLVTDeCgf
 SaVR2s1VE53lelkr7Ad+HG2YKzxgjTexwTjr7ZPe3DWLyaVBqKSM+i/W6h8FB0CQKeP3kk
 DzZsK1JrI7CWLW7qhIqwVU9zbPDEYN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-Jh03PNsBNRuU1iDmUFCGUA-1; Tue, 01 Dec 2020 15:50:12 -0500
X-MC-Unique: Jh03PNsBNRuU1iDmUFCGUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F811005E53;
 Tue,  1 Dec 2020 20:50:11 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F2535C1B4;
 Tue,  1 Dec 2020 20:50:07 +0000 (UTC)
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
References: <cover.1605439674.git.lukasstraub2@web.de>
 <14b78aebabb64b9f2ffaac025ee3b683bd7c9167.1605439674.git.lukasstraub2@web.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v11 2/7] block/nbd.c: Add yank feature
Message-ID: <f08e48b1-c716-4ef9-74a1-9f8c66911355@redhat.com>
Date: Tue, 1 Dec 2020 14:50:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <14b78aebabb64b9f2ffaac025ee3b683bd7c9167.1605439674.git.lukasstraub2@web.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/20 5:36 AM, Lukas Straub wrote:
> Register a yank function which shuts down the socket and sets
> s->state = NBD_CLIENT_QUIT. This is the same behaviour as if an
> error occured.

occurred

> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/nbd.c | 154 +++++++++++++++++++++++++++++++---------------------
>  1 file changed, 93 insertions(+), 61 deletions(-)
> 

> @@ -166,12 +168,12 @@ static void nbd_clear_bdrvstate(BDRVNBDState *s)
>  static void nbd_channel_error(BDRVNBDState *s, int ret)
>  {
>      if (ret == -EIO) {
> -        if (s->state == NBD_CLIENT_CONNECTED) {
> +        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {

This may have interesting interactions with Vladimir's latest patches to
make NBD connection re-startable, but we'll sort that out as needed.
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07012.html

The patch seems big; I might have broken it into two pieces (conversion
of existing logic to use qatomic_*() accesses instead of direct s->state
manipulation, and then adding new logic).  But I'm not going to hold up
the series demanding for a split at this time.


> @@ -424,12 +427,12 @@ static void *connect_thread_func(void *opaque)
>      return NULL;
>  }
> 
> -static QIOChannelSocket *coroutine_fn
> +static int coroutine_fn
>  nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>  {
> +    int ret;
>      QemuThread thread;
>      BDRVNBDState *s = bs->opaque;
> -    QIOChannelSocket *res;
>      NBDConnectThread *thr = s->connect_thread;
> 
>      qemu_mutex_lock(&thr->mutex);
> @@ -446,10 +449,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>      case CONNECT_THREAD_SUCCESS:
>          /* Previous attempt finally succeeded in background */
>          thr->state = CONNECT_THREAD_NONE;
> -        res = thr->sioc;
> +        s->sioc = thr->sioc;
>          thr->sioc = NULL;
> +        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> +                               nbd_yank, bs);
>          qemu_mutex_unlock(&thr->mutex);
> -        return res;
> +        return 0;

Looks sensible.

> @@ -1745,6 +1759,15 @@ static int nbd_client_reopen_prepare(BDRVReopenState *state,
>      return 0;
>  }
> 
> +static void nbd_yank(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> +
> +    qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
> +    qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +}
> +

Yep, that does indeed tell qemu to give up on the NBD socket right away.

Reviewed-by: Eric Blake <eblake@redhat.com>

And sorry it's taken me so long to actually stare at this series.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


