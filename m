Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E24316C65
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:18:45 +0100 (CET)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t8V-0004Um-WA
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1l9spX-0000Pd-1b
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:59:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1l9spS-0004RW-Jm
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zgYkj0s/jglDJgDIwUlULUuM5bL3AXe5kJNtKD1wozM=;
 b=J6SdD3qYgNPnFwFi18YCwkc89B7B9YPE1v4Xkqvpz5UDcOoQ/RIjw2pWa23uoY4GHInAX4
 Q6tHX4l0WOgmmmm4xJBynx9pE9HkWOh7vR8TGHIJed7uGoWf15oxN/0qY7DwG102kQaSAY
 vP5TuQoEo/GjLs1Te/lHowXhIgAsre0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-N0IJJDwWNde58r0UwGIgEA-1; Wed, 10 Feb 2021 11:58:58 -0500
X-MC-Unique: N0IJJDwWNde58r0UwGIgEA-1
Received: by mail-ot1-f69.google.com with SMTP id o27so1300988otj.8
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 08:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgYkj0s/jglDJgDIwUlULUuM5bL3AXe5kJNtKD1wozM=;
 b=C8Nx+CzIHWGBpE2y89y9T7l0H5362hegp4GvWR50kqnecxQyEQke2GsvYJlRKoFDLE
 KOqwdxMqkt5Gwj1HU0YbadXxae8i+T6Whnct2myV/oviOAsHZRJYA/uLBpGQ26GrhEDX
 Yexdnk8P/F9J9CfIz6rgd6+ynjTWV3TdO5CZQQLb3/Ulr5wLpORczsE+m6TTJxs284Oa
 nOYpO0lbgoFPe4/6rehPE35fF+MgH05sw5247zGC3Z6BDWMIxB7c5viC3KoB3I60mj7T
 qQGVJzjfOb0RqSBqVvfS1R961fMFL/bJV+vq8F+Wxj4PIi4C2r8sU/z9KUe2jMWOdFHo
 lQ/g==
X-Gm-Message-State: AOAM533ejG+KY2+w5nuwTPzWqkMO6/W5DNbPViIEYEKqR4VMRUCmX6cK
 /ArdKThjVEHQc+MCqC/gJR7tXhVKJRo0cBZovNoGbg6l12nymdCAINy3WbH/aWxdRc8di2CPsSj
 Z0QkpXF1/dmbbB7JIIv0uJD2pztXQRvw=
X-Received: by 2002:a9d:6f0f:: with SMTP id n15mr2783340otq.170.1612976337320; 
 Wed, 10 Feb 2021 08:58:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIbg3OH1Zi1LD85M3fvhwiBt4JEBBtMxhnaw2kwYvoiAUV60/T9EdfI/wvUqgVv91a0UaZjokcUDsXbwWgWNE=
X-Received: by 2002:a9d:6f0f:: with SMTP id n15mr2783316otq.170.1612976336952; 
 Wed, 10 Feb 2021 08:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20210209152759.209074-1-eblake@redhat.com>
 <20210209152759.209074-2-eblake@redhat.com>
In-Reply-To: <20210209152759.209074-2-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 10 Feb 2021 18:58:40 +0200
Message-ID: <CAMRbyysfzGJdnYq8uieB=7qXz8Xpno1cUF0RJnreiME0opedSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 qemu-stable@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 9, 2021 at 5:28 PM Eric Blake <eblake@redhat.com> wrote:
>
> Our default of a backlog of 1 connection is rather puny; it gets in
> the way when we are explicitly allowing multiple clients (such as
> qemu-nbd -e N [--shared], or nbd-server-start with its default
> "max-connections":0 for unlimited), but is even a problem when we
> stick to qemu-nbd's default of only 1 active client but use -t
> [--persistent] where a second client can start using the server once
> the first finishes.  While the effects are less noticeable on TCP
> sockets (since the client can poll() to learn when the server is ready
> again), it is definitely observable on Unix sockets, where on Unix, a
> client will fail with EAGAIN and no recourse but to sleep an arbitrary
> amount of time before retrying if the server backlog is already full.
>
> Since QMP nbd-server-start is always persistent, it now always
> requests a backlog of SOMAXCONN;

This makes sense since we don't limit the number of connections.

> meanwhile, qemu-nbd will request
> SOMAXCONN if persistent, otherwise its backlog should be based on the
> expected number of clients.

If --persistent is used without --shared, we allow only one concurrent
connection, so not clear why we need maximum backlog.

I think that separating --persistent and --shared would be easier to
understand and use. The backlog will always be based on shared value.

> See https://bugzilla.redhat.com/1925045 for a demonstration of where
> our low backlog prevents libnbd from connecting as many parallel
> clients as it wants.
>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> CC: qemu-stable@nongnu.org
> ---
>  blockdev-nbd.c |  7 ++++++-
>  qemu-nbd.c     | 10 +++++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index d8443d235b73..b264620b98d8 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -134,7 +134,12 @@ void nbd_server_start(SocketAddress *addr, const char *tls_creds,
>      qio_net_listener_set_name(nbd_server->listener,
>                                "nbd-listener");
>
> -    if (qio_net_listener_open_sync(nbd_server->listener, addr, 1, errp) < 0) {
> +    /*
> +     * Because this server is persistent, a backlog of SOMAXCONN is
> +     * better than trying to size it to max_connections.

The comment is not clear. Previously we used hard code value (1) but we
do support more than one connection. Maybe it is better to explain that we
don't know how many connections are needed?

> +     */
> +    if (qio_net_listener_open_sync(nbd_server->listener, addr, SOMAXCONN,
> +                                   errp) < 0) {
>          goto error;
>      }
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 608c63e82a25..1a340ea4858d 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -964,8 +964,16 @@ int main(int argc, char **argv)
>
>      server = qio_net_listener_new();
>      if (socket_activation == 0) {
> +        int backlog;
> +
> +        if (persistent) {
> +            backlog = SOMAXCONN;

This increases the backlog, but since default shared is still 1, we will
not accept more than 1 connection, so not clear why SOMAXCONN
is better.

> +        } else {
> +            backlog = MIN(shared, SOMAXCONN);
> +        }
>          saddr = nbd_build_socket_address(sockpath, bindto, port);
> -        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0) {
> +        if (qio_net_listener_open_sync(server, saddr, backlog,
> +                                       &local_err) < 0) {
>              object_unref(OBJECT(server));
>              error_report_err(local_err);
>              exit(EXIT_FAILURE);
> --
> 2.30.0
>


