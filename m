Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B733D3CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 17:52:43 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xTd-0001VE-Rg
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 11:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6xRD-00079s-0e
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6xR9-0000Ua-4K
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627055405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T3hZXiB6hrL0SIBDxnz9Bj6az5LbezJWtoTY1ZXQXV4=;
 b=AV3w0gUKd5Yu99tv1Dfn8QivwtPBWQAf6QtdlGCAbMiAqAfZBKMZ76Q2tYMrwXayfI2mns
 xRYm/KkkxECtTx6FBKDl+ibl4Dn2Ld6f0R7l4ofssbiJCAUWG8gWqdJpZoBsAdEZQQRzGc
 +0MzGMU7AmHHCuQ4iY86ieshFx01fls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-FmMBEaP9Ns-4XmNHTN_u3Q-1; Fri, 23 Jul 2021 11:50:02 -0400
X-MC-Unique: FmMBEaP9Ns-4XmNHTN_u3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F3D1C73A0;
 Fri, 23 Jul 2021 15:50:01 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.phx2.redhat.com [10.3.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8B360C13;
 Fri, 23 Jul 2021 15:50:00 +0000 (UTC)
Date: Fri, 23 Jul 2021 10:49:59 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210723154930.efupqunf3r3ce37e@redhat.com>
References: <20210722104552.2351167-1-rjones@redhat.com>
 <20210722104552.2351167-2-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722104552.2351167-2-rjones@redhat.com>
User-Agent: NeoMutt/20210205-637-385b0a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 11:45:52AM +0100, Richard W.M. Jones wrote:
> $ rm -f /tmp/sock /tmp/pid
> $ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
> $ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
> qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> $ killall qemu-nbd
> 
> nbdsh is abruptly dropping the NBD connection here which is a valid
> way to close the connection.  It seems unnecessary to print an error
> in this case so this commit suppresses it.
> 
> Note that if you call the nbdsh h.shutdown() method then the message
> was not printed:
> 
> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'

A client not shutting down cleanly might cause the server to leave the
disk in an unspecified state prior to the next client (more
concretely, a client that just disconnects instead of waiting for a
flush to land may result in data loss from the point of view of that
client when it reconnects, although the server was never in the
wrong).  But for your _specific_ example here of a client that only
performs read actions and does not modify the disk, there is obviously
no data loss possible.

But you are also correct that a client that disconnects abruptly
instead of cleanly is a common enough event that warning about it can
just feel noisy.  Is this the sort of thing that users would want a
command-line knob to opt in or out of those warnings (and what default
should that knob take), or should this be something we just always
ignore?  Or maybe we make the warning conditional on whether the
client attempted any modification to the image, being silent on
default to a client that merely reads, and only noisy for a client
that attempted at least one write but disconnected before we could
reply that the write or subsequent flush was complete.

qemu-storage-daemon has to answer the same question, so I'd like
Kevin's take on the matter to make sure we pick an answer we are
consistently happy with.

> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  nbd/server.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index b60ebc3ab6..0f86535b88 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2668,7 +2668,11 @@ static coroutine_fn void nbd_trip(void *opaque)
>          ret = nbd_handle_request(client, &request, req->data, &local_err);
>      }
>      if (ret < 0) {
> -        error_prepend(&local_err, "Failed to send reply: ");
> +        if (errno != EPIPE) {
> +            error_prepend(&local_err, "Failed to send reply: ");
> +        } else {
> +            local_err = NULL;

This line should be error_free(local_err) to avoid a memleak.

> +        }
>          goto disconnect;
>      }
>  
> -- 
> 2.32.0
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


