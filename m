Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67ED454A4A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:48:39 +0100 (CET)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNAs-0000zs-PN
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnN9v-000827-M1
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:47:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnN9u-0000X5-68
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637164057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jH2THDhVXvjqel53XsXar0Zk5qCytaSmt4PB9y5eC9I=;
 b=TOfraAaTlZrxGztVU23LspGyZLNlcUErG6azqaYlyxuyKYQdF3snvOAq2gBKvmPTe8cdRE
 0IELTVuSPAMv5llAMuOSya+4CfXXn5tGxnQOkbYUysd2CYduHu3ZJFkWKwS9nhaMSSs/Hn
 5CzSrA3LPF0jIZskSx1z6lcP0DO9ZPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-gIlvzSihOWeLdiaZgZhktw-1; Wed, 17 Nov 2021 10:47:34 -0500
X-MC-Unique: gIlvzSihOWeLdiaZgZhktw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 186D3100D68D;
 Wed, 17 Nov 2021 15:47:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 015A75BB06;
 Wed, 17 Nov 2021 15:47:29 +0000 (UTC)
Date: Wed, 17 Nov 2021 09:47:28 -0600
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20211117154728.6bd6uo622zoentur@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913151936.392705-1-rjones@redhat.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Revisiting an older thread

On Mon, Sep 13, 2021 at 04:19:36PM +0100, Richard W.M. Jones wrote:
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

I've investigated this a bit further, and found that we have a
regression in 6.0 when the abrupt disconnect occurs over TCP instead
of Unix sockets.  Prior to that point, if a client does a hard
disconnect with no pending message, a 5.2 server reports:

$ qemu-nbd -f raw file &
[1] 1059670
$ nbdsh -u nbd://localhost:10809 -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to read request: Unexpected end-of-file before all bytes were read
[1]+  Done                    qemu-nbd -f raw file

but in 6.0, we started reporting:

qemu-nbd: Disconnect client, due to: Request handling failed in intermediate state

and looking further, I discovered that if you also use --trace=nbd_\*,
qemu-nbd ends up tracing uninitialized memory; it is now failing
because it sees an unexpected magic number from the uninitialized
memory, rather than its earlier detection of early EOF.

It's interesting that a Unix socket sees EPIPE when a TCP socket does
not, but it also means that your patch in isolation won't solve the
TCP issue, so I'm trying to come up with something today.

> 
> Note that if you call the nbdsh h.shutdown() method then the message
> was not printed:
> 
> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  nbd/server.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 3927f7789d..e0a43802b2 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
>          ret = nbd_handle_request(client, &request, req->data, &local_err);
>      }
>      if (ret < 0) {
> -        error_prepend(&local_err, "Failed to send reply: ");
> +        if (errno != EPIPE) {
> +            error_prepend(&local_err, "Failed to send reply: ");
> +        } else {
> +            error_free(local_err);
> +            local_err = NULL;
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


