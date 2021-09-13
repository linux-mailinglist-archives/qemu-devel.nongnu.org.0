Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DE4096C5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:08:53 +0200 (CEST)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnZk-0004gJ-FU
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mPnYH-000321-Sw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mPnYF-0003n4-Cz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631545638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HRgbk+3owm9rtTw6SCtXnWlCQVpFTWZm2yEry2ybEE=;
 b=Qyk0vgLwfJL1SgU649Hi3Ip42LNAK2f9l4AXHhAheKxZYVp2FfIErx1YVkfKqnfWwwxum4
 ZMXxmH8puiL7Ol9PV6yTHMPbmfVFJiesDghOvtq0qdsP7yc1iclmxNvgbm5G9tf0qQT3L7
 Z8UuiF3gMoGu613vj1B21hqIXbunVbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-40CYIO9CMpao4B005FiMVg-1; Mon, 13 Sep 2021 11:07:15 -0400
X-MC-Unique: 40CYIO9CMpao4B005FiMVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCB14835DE0;
 Mon, 13 Sep 2021 15:07:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A31336A8E4;
 Mon, 13 Sep 2021 15:07:13 +0000 (UTC)
Date: Mon, 13 Sep 2021 17:07:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <YT9pILPJc5azU9nH@redhat.com>
References: <20210722104552.2351167-1-rjones@redhat.com>
 <20210722104552.2351167-2-rjones@redhat.com>
 <20210723154930.efupqunf3r3ce37e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723154930.efupqunf3r3ce37e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: vsementsov@virtuozzo.com, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.07.2021 um 17:49 hat Eric Blake geschrieben:
> On Thu, Jul 22, 2021 at 11:45:52AM +0100, Richard W.M. Jones wrote:
> > $ rm -f /tmp/sock /tmp/pid
> > $ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
> > $ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
> > $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
> > qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> > $ killall qemu-nbd
> > 
> > nbdsh is abruptly dropping the NBD connection here which is a valid
> > way to close the connection.  It seems unnecessary to print an error
> > in this case so this commit suppresses it.
> > 
> > Note that if you call the nbdsh h.shutdown() method then the message
> > was not printed:
> > 
> > $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'
> 
> A client not shutting down cleanly might cause the server to leave the
> disk in an unspecified state prior to the next client (more
> concretely, a client that just disconnects instead of waiting for a
> flush to land may result in data loss from the point of view of that
> client when it reconnects, although the server was never in the
> wrong).

I think in such cases, clients must assume that all in-flight requests
have failed. Request failure means that the state is undefined. You
could have the old content, you could have the new content, or you could
have some random corruption.

> But for your _specific_ example here of a client that only performs
> read actions and does not modify the disk, there is obviously no data
> loss possible.
> 
> But you are also correct that a client that disconnects abruptly
> instead of cleanly is a common enough event that warning about it can
> just feel noisy.  Is this the sort of thing that users would want a
> command-line knob to opt in or out of those warnings (and what default
> should that knob take), or should this be something we just always
> ignore?  Or maybe we make the warning conditional on whether the
> client attempted any modification to the image, being silent on
> default to a client that merely reads, and only noisy for a client
> that attempted at least one write but disconnected before we could
> reply that the write or subsequent flush was complete.
> 
> qemu-storage-daemon has to answer the same question, so I'd like
> Kevin's take on the matter to make sure we pick an answer we are
> consistently happy with.

So I don't think I would make a difference between read-only and
read-write clients. The consideration whether we should print an error
message or not feels more like something that becomes relevant when
debugging a bug that we can't reproduce and just get a bunch of logs. I
feel that abrupt disconnects could in some cases be useful information
to have there.

Essentially it's something that you would configure with log levels, but
we don't really have that (and even if we had it, in practice management
tools would use one default setting). So I feel we have to decide for
one thing or the other. Since bugs involving NBD are probably something
you'll have to debug, maybe you should pick. I don't really mind either
way.

> > 
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > ---
> >  nbd/server.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/nbd/server.c b/nbd/server.c
> > index b60ebc3ab6..0f86535b88 100644
> > --- a/nbd/server.c
> > +++ b/nbd/server.c
> > @@ -2668,7 +2668,11 @@ static coroutine_fn void nbd_trip(void *opaque)
> >          ret = nbd_handle_request(client, &request, req->data, &local_err);
> >      }
> >      if (ret < 0) {
> > -        error_prepend(&local_err, "Failed to send reply: ");
> > +        if (errno != EPIPE) {
> > +            error_prepend(&local_err, "Failed to send reply: ");
> > +        } else {
> > +            local_err = NULL;
> 
> This line should be error_free(local_err) to avoid a memleak.

Actually, you want both error_free(local_err) and local_err = NULL.

> > +        }
> >          goto disconnect;
> >      }

Kevin


