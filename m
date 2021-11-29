Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF61461D3F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:59:53 +0100 (CET)
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkwS-0007kc-0O
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mrkY9-0001VO-Gv
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:34:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mrkY4-0003zz-6L
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638207279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yeJSM7T9e5mLW7nyektXyoqEXeYAR5bMg/aHQGKoqLk=;
 b=giFrlwxhpAa+qmiNxP977cGg1b1rUubTXcqYds9lfCqrWpO2z30FMgenGfyCV8A1gixMyq
 NdUTJxlKumppKt1tDmX3fOtj0LNPQ8ACWXF88mfOBYuBf3iD/DXBDu33dzZTzQxxmuvN+w
 SSTXR6o/JyfuNhapb0moGSsgKusbOiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-r3O9zOLwPi2fs-UVbN_zCw-1; Mon, 29 Nov 2021 12:34:36 -0500
X-MC-Unique: r3O9zOLwPi2fs-UVbN_zCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AED3264083;
 Mon, 29 Nov 2021 17:34:34 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB5A60622;
 Mon, 29 Nov 2021 17:34:30 +0000 (UTC)
Date: Mon, 29 Nov 2021 11:34:28 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC for-6.2] block/nbd: forbid incompatible change of server
 options on reconnect
Message-ID: <20211129173428.fqpcxd4ipjwrsr6u@redhat.com>
References: <20211124140951.439684-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211124140951.439684-1-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:09:51PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Reconnect feature was never prepared to handle server options changed
> on reconnect. Let's be stricter and check what exactly is changed. If
> server capabilities just got richer don't worry. Otherwise fail and
> drop the established connection.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! The patch is probably good for 6.2. It's an RFC because I didn't
> test it yet) But I want to early send, so that my proposed design be
> available for discussion.

We're cutting it awfully close.  My justification for including it in
-rc3 (if we like it) is that it is a lot easier to audit that we
reject server downgrades than it is to audit whether we have a CVE
because of a server downgrade across a reconnect.  But it is not a new
regression to 6.2, so slipping it to 7.0 (if we don't feel comfortable
with the current iteration of the patch) is okay on that front.

> 
> 
>  include/block/nbd.h     |  9 +++++
>  nbd/client-connection.c | 86 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 78d101b774..3d379b5539 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -157,6 +157,10 @@ enum {
>  #define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
>  #define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
>  #define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
> +/*
> + * If you add any new NBD_FLAG_ flag, check that logic in
> + * nbd_is_new_info_compatible() is still good about handling flags.
> + */
>  
>  /* New-style handshake (global) flags, sent from server to client, and
>     control what will happen during handshake phase. */
> @@ -305,6 +309,11 @@ struct NBDExportInfo {
>  
>      uint32_t context_id;
>  
> +    /*
> +     * WARNING! when add any new field to the structure, don't forget to check

adding

> +     * and updated nbd_is_new_info_compatible() function.

update the

> +     */

Odd that one comment has WARNING! and the other does not.

> +
>      /* Set by server results during nbd_receive_export_list() */
>      char *description;
>      int n_contexts;
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 695f855754..2d66993632 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -37,6 +37,10 @@ struct NBDClientConnection {
>      bool do_negotiation;
>      bool do_retry;
>  
> +    /* Used only by connection thread, no need in locking the mutex */

s/no need in locking the mutex/does not need mutex protection/

> +    bool has_prev_info;
> +    NBDExportInfo prev_info;
> +
>      QemuMutex mutex;
>  
>      /*
> @@ -160,6 +164,67 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>      return 0;
>  }
>  
> +static bool nbd_is_new_info_compatible(NBDExportInfo *old, NBDExportInfo *new,
> +                                       Error **errp)
> +{
> +    uint32_t dropped_flags;
> +
> +    if (old->structured_reply && !new->structured_reply) {
> +        error_setg(errp, "Server options degrade after reconnect: "

degraded

> +                   "structured_reply is not supported anymore");
> +        return false;
> +    }
> +
> +    if (old->base_allocation && !new->base_allocation) {
> +        error_setg(errp, "Server options degrade after reconnect: "

degraded

> +                   "base_allocation is not supported anymore");
> +        return false;
> +    }

Do we also need to insist that the context id value be identical, or
can our code gracefully deal with it being different?  We don't ever
send the context id, so even if we retry a CMD_BLOCK_STATUS, our real
risk is whether we will reject the new server's reply because it used
a different id than we were expecting.

> +
> +    if (old->size != new->size) {
> +        error_setg(errp, "NBD export size changed after reconnect");
> +        return false;
> +    }
> +
> +    /*
> +     * No worry if rotational status changed. But other flags are feature flags,
> +     * they should not degrade.
> +     */
> +    dropped_flags = (old->flags & ~new->flags) & ~NBD_FLAG_ROTATIONAL;
> +    if (dropped_flags) {
> +        error_setg(errp, "Server options degrade after reconnect: flags 0x%"

degraded

> +                   PRIx32 " are not reported anymore", dropped_flags);
> +        return false;
> +    }
> +
> +    if (new->min_block > old->min_block) {
> +        error_setg(errp, "Server requires more strict min_block after "
> +                   "reconnect: %" PRIu32 " instead of %" PRIu32,
> +                   new->min_block, old->min_block);
> +        return false;
> +    }

Good...

> +    if (new->min_block && (old->min_block % new->min_block)) {
> +        error_setg(errp, "Server requires new min_block %" PRIu32
> +                   " after reconnect, incompatible with old one %" PRIu32,
> +                   new->min_block, old->min_block);
> +        return false;
> +    }

...but why is this one necessary?  Since min_block has to be a power
of 2, and you just proved that new->min_block <= old->min_block above,
this condition will always be false.

> +
> +    if (new->max_block < old->max_block) {
> +        error_setg(errp, "Server requires more strict max_block after "
> +                   "reconnect: %" PRIu32 " instead of %" PRIu32,
> +                   new->max_block, old->max_block);
> +        return false;
> +    }
> +
> +    if (old->context_id != new->context_id) {
> +        error_setg(errp, "Meta context id changed after reconnect");
> +        return false;
> +    }

Oh, this answers my question above. We should put this near where we
check above.  And this check should only be performed if
base_allocation was supported in the old server (if the old server
lacks it and the new server supports it, the ids may be differ, but
that's an upgrade, not a downgrade, and we don't care).

> +
> +    return true;
> +}
> +
>  static void *connect_thread_func(void *opaque)
>  {
>      NBDClientConnection *conn = opaque;
> @@ -183,6 +248,27 @@ static void *connect_thread_func(void *opaque)
>                            conn->do_negotiation ? &conn->updated_info : NULL,
>                            conn->tlscreds, &conn->ioc, &conn->err);
>  
> +        if (ret == 0) {
> +            if (conn->has_prev_info &&
> +                !nbd_is_new_info_compatible(&conn->prev_info,
> +                                            &conn->updated_info, &conn->err))
> +            {
> +                NBDRequest request = { .type = NBD_CMD_DISC };
> +                QIOChannel *ioc = conn->ioc ?: QIO_CHANNEL(conn->sioc);
> +
> +                nbd_send_request(ioc, &request);
> +                qio_channel_close(ioc, NULL);
> +
> +                object_unref(OBJECT(conn->ioc));
> +                conn->ioc = NULL;
> +
> +                ret = -EINVAL;
> +            } else {
> +                conn->prev_info = conn->updated_info;
> +                conn->has_prev_info = true;
> +            }
> +        }
> +
>          /*
>           * conn->updated_info will finally be returned to the user. Clear the
>           * pointers to our internally allocated strings, which are IN parameters
> -- 
> 2.31.1
>

Looks like it is on the right track.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


