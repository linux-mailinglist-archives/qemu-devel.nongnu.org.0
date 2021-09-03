Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF540033E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:26:41 +0200 (CEST)
Received: from localhost ([::1]:38528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMC1Y-0006NC-R2
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMBs1-0002rW-CX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMBrx-0000nc-Pn
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630685804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DVpX7asYtOBpub3evycVS0OWTVq9Kr9E8PraeXs3XCQ=;
 b=ak9ei3XEJmHxyqvQkt0uTtYP/Exmma7MO+yocJtLhFxAwlLTB1rrs8mReCCjZNoK7l/pAN
 O4f0fesLrUva8tqsmXHPP9xeak5gk3kNlO2X6qXtWL0LdojGnTemKT6FfRVQRQiKAvu28F
 qY38zsEAXNvVY0DeMXiWeVnbXtg/MTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-O9Y5aT-NO_u0iP8U9x5p9g-1; Fri, 03 Sep 2021 12:16:42 -0400
X-MC-Unique: O9Y5aT-NO_u0iP8U9x5p9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF7E6100670C;
 Fri,  3 Sep 2021 16:16:35 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 658A169CBB;
 Fri,  3 Sep 2021 16:16:35 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:16:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 1/5] block/nbd: nbd_channel_error() shutdown channel
 unconditionally
Message-ID: <20210903161633.6ribvygzdvtqpfu5@redhat.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
 <20210902103805.25686-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210902103805.25686-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rkagan@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 01:38:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Don't rely on connection being totally broken in case of -EIO. More
> safe and correct just shutdown the channel anyway, as we change the
> state and going to reconnect.

If you don't mind me tweaking grammar, I propose:

Safer and more correct is to just shut down the channel anyway, since
we change the state and plan on reconnecting.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/nbd.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index f6ff1c4fb4..d88f4b954c 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -129,15 +129,16 @@ static bool nbd_client_connected(BDRVNBDState *s)
>  
>  static void nbd_channel_error(BDRVNBDState *s, int ret)
>  {
> +    if (nbd_client_connected(s)) {
> +        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +    }
> +
>      if (ret == -EIO) {
>          if (nbd_client_connected(s)) {
>              s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
>                                              NBD_CLIENT_CONNECTING_NOWAIT;
>          }
>      } else {
> -        if (nbd_client_connected(s)) {
> -            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> -        }
>          s->state = NBD_CLIENT_QUIT;
>      }
>  }
> -- 
> 2.29.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


