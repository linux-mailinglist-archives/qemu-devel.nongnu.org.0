Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F4E6C8619
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:43:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfnIA-0003Gp-7m; Fri, 24 Mar 2023 15:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfnI7-0003G4-II
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfnI5-0004qi-CM
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679686887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=opN6m6vFBuiP0KgaErpIlW4Y2H3T7uYtUclFhIb1Ji0=;
 b=Wqb44RJO0tF8NuR5hd3+uEXfREP/CsL6W+KdwtKKskgm4DpGYAtczFfsQeKSDitp+iWzwH
 NiXDq+UHq2mKcNRxmbE9Ywb4gNx77NF37SclQp7EbRKzINWy88zDdmnA1q4vT9G1WGFjvf
 RDFf1wNc4EsVnAfC8Mo2mCpXUctztz8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-E5BdqfqtPG64BdjA2wrsrQ-1; Fri, 24 Mar 2023 15:41:23 -0400
X-MC-Unique: E5BdqfqtPG64BdjA2wrsrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22E3E3815F73;
 Fri, 24 Mar 2023 19:41:23 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7370F18EC7;
 Fri, 24 Mar 2023 19:41:22 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:41:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Florian Westphal <fw@strlen.de>
Cc: qemu-block@nongnu.org, vsementsov@yandex-team.ru, 
 qemu-devel@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH 1/1] nbd/server: push pending frames after sending reply
Message-ID: <ervljl6tt35qenv3z5lrjbklxuwezjvqpbwghtdntddpwa3glb@czoajnfpuxaa>
References: <20230324104720.2498-1-fw@strlen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324104720.2498-1-fw@strlen.de>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 24, 2023 at 11:47:20AM +0100, Florian Westphal wrote:
> qemu-nbd doesn't set TCP_NODELAY on the tcp socket.
> 
> Kernel waits for more data and avoids transmission of small packets.
> Without TLS this is barely noticeable, but with TLS this really shows.
> 
> Booting a VM via qemu-nbd on localhost (with tls) takes more than
> 2 minutes on my system.  tcpdump shows frequent wait periods, where no
> packets get sent for a 40ms period.

Thank you for this analysis.

> 
> Add explicit (un)corking when processing (and responding to) requests.
> "TCP_CORK, &zero" after earlier "CORK, &one" will flush pending data.
> 
> VM Boot time:
> main:    no tls:  23s, with tls: 2m45s
> patched: no tls:  14s, with tls: 15s
> 
> VM Boot time, qemu-nbd via network (same lan):
> main:    no tls:  18s, with tls: 1m50s
> patched: no tls:  17s, with tls: 18s

And the timings bear proof that it matters.

> 
> Future optimization: if we could detect if there is another pending
> request we could defer the uncork operation because more data would be
> appended.

nbdkit and libnbd do this with the MSG_MORE flag (plaintext) and TLS
corking (tls); when building up a message to the other side, a flag is
set any time we know we are likely to send more data very shortly.

nbdkit wraps it under a flag SEND_MORE, which applies to both plaintext:
https://gitlab.com/nbdkit/nbdkit/-/blob/master/server/connections.c#L415
and to TLS connections:
https://gitlab.com/nbdkit/nbdkit/-/blob/master/server/crypto.c#L396

while libnbd uses MSG_MORE a bit more directly for the same purpose
for plaintext, but isn't (yet) doing TLS corking:
https://gitlab.com/nbdkit/libnbd/-/blob/master/generator/states-issue-command.c#L53
https://gitlab.com/nbdkit/libnbd/-/blob/master/lib/internal.h#L57

I would love to see a future patch to qio_channel code to support
MSG_MORE in the same way as nbdkit is using its SEND_MORE flag, as the
caller often has more info on whether it is sending a short prefix or
is done with a conceptual message and ready to uncork, and where the
use of a flag can be more efficient than separate passes through
cork/uncork calls.  But even your initial work at properly corking is
a good step in the right direction.

And surprisingly, qemu IS using corking on the client side:
https://gitlab.com/qemu-project/qemu/-/blob/master/block/nbd.c#L525
just not on the server side, before your patch.

> 
> Signed-off-by: Florian Westphal <fw@strlen.de>
> ---
>  nbd/server.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index a4750e41880a..848836d41405 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2667,6 +2667,8 @@ static coroutine_fn void nbd_trip(void *opaque)
>          goto disconnect;
>      }
>  
> +    qio_channel_set_cork(client->ioc, true);
> +
>      if (ret < 0) {
>          /* It wasn't -EIO, so, according to nbd_co_receive_request()
>           * semantics, we should return the error to the client. */
> @@ -2692,6 +2694,7 @@ static coroutine_fn void nbd_trip(void *opaque)
>          goto disconnect;
>      }
>  
> +    qio_channel_set_cork(client->ioc, false);

Reviewed-by: Eric Blake <eblake@redhat.com>

>  done:
>      nbd_request_put(req);
>      nbd_client_put(client);
> -- 
> 2.39.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


