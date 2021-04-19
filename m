Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15595363EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:36:46 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQKi-0007xd-Dw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYQJJ-0007Id-Gh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYQJH-0006tR-Qe
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618824914;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8E5K3evNARUlrEMHX6BzNvRHeQxSPV3b+iXXb0XRkrQ=;
 b=RkK2dKinYv3k4gFzWKTmHAXCsjlAkq0XbK4G4wmfBmUQlvdZU49L4sNttWCC9OcpS3kxYX
 rc+ru+lyjXvnjaoEAPR8cVrwDguH3FozSdXHts90fT3KZzVgbB+qfaNt1MXaI4P53+WsPw
 GZLqEl7H11DGywFa05JiPpC+zYwsers=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-komq4ZIoMzOILt7fvj2gAg-1; Mon, 19 Apr 2021 05:35:01 -0400
X-MC-Unique: komq4ZIoMzOILt7fvj2gAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC75887A841;
 Mon, 19 Apr 2021 09:34:59 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9243362A6F;
 Mon, 19 Apr 2021 09:34:52 +0000 (UTC)
Date: Mon, 19 Apr 2021 10:34:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 21/33] qemu-socket: pass monitor link to socket_get_fd
 directly
Message-ID: <YH1OuUYuLYkHY2ni@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-22-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-22-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, Gerd Hoffmann <kraxel@redhat.com>,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:59AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Detecting monitor by current coroutine works bad when we are not in
> coroutine context. And that's exactly so in nbd reconnect code, where
> qio_channel_socket_connect_sync() is called from thread.
> 
> Add a possibility to pass monitor by hand, to be used in the following
> commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/io/channel-socket.h    | 20 ++++++++++++++++++++
>  include/qemu/sockets.h         |  2 +-
>  io/channel-socket.c            | 17 +++++++++++++----
>  tests/unit/test-util-sockets.c | 16 ++++++++--------
>  util/qemu-sockets.c            | 10 +++++-----
>  5 files changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..6d0915420d 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -78,6 +78,23 @@ qio_channel_socket_new_fd(int fd,
>                            Error **errp);
>  
>  
> +/**
> + * qio_channel_socket_connect_sync_mon:
> + * @ioc: the socket channel object
> + * @addr: the address to connect to
> + * @mon: current monitor. If NULL, it will be detected by
> + *       current coroutine.
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Attempt to connect to the address @addr. This method
> + * will run in the foreground so the caller will not regain
> + * execution control until the connection is established or
> + * an error occurs.
> + */
> +int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
> +                                        SocketAddress *addr,
> +                                        Monitor *mon,
> +                                        Error **errp);

I don't really like exposing the concept of the QEMU monitor in
the IO layer APIs. IMHO these ought to remain completely separate
subsystems from the API pov, and we ought to fix this problem by
making monitor_cur() work better in the scenario required.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


