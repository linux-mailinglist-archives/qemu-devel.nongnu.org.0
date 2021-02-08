Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70779313A1A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:54:09 +0100 (CET)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99nc-0002NW-HT
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l93Lg-0002r1-FU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:00:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l93LI-0004Oo-6b
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612778423;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VXejB2qcWy2IvT/SuGa8jnsONcvREJESGytdgfKnPtA=;
 b=HQzCB2N/t046IL/5mGlTWiNbd375H7W9Y6LSNZxiK8uhRQ1kDMslfuqngs8/oxNNQFoLgO
 N6wHxlqjpxR9dC0cg/QWws/o4QN/XWtV6G5J8Rnk+KdDL9A8bO6WvwSo1wxzxND118VOTQ
 waOSmbtmOQjkTe/aR0Ykq8lK0KbjCz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-b5VXmquLM_-9b0nPQvBwtw-1; Mon, 08 Feb 2021 05:00:16 -0500
X-MC-Unique: b5VXmquLM_-9b0nPQvBwtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 560F59114A;
 Mon,  8 Feb 2021 10:00:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCDF1412A;
 Mon,  8 Feb 2021 10:00:12 +0000 (UTC)
Date: Mon, 8 Feb 2021 10:00:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
Message-ID: <20210208100004.GD1141037@redhat.com>
References: <20210205185705.1502071-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205185705.1502071-1-eblake@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 12:57:05PM -0600, Eric Blake wrote:
> Our default of a backlog of 1 connection is rather puny, particularly
> for scenarios where we expect multiple listeners to connect (such as
> qemu-nbd -e X).  This is especially important for Unix sockets, as a
> definite benefit to clients: at least on Linux, a client trying to
> connect to a Unix socket with a backlog gets an EAGAIN failure with no
> way to poll() for when the backlog is no longer present short of
> sleeping an arbitrary amount of time before retrying.
> 
> See https://bugzilla.redhat.com/1925045 for a demonstration of where
> our low backlog prevents libnbd from connecting as many parallel
> clients as it wants.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> v2: target the correct API used by qemu-nbd, rather than an unrelated
> legacy wrapper [Dan]
> 
>  qemu-nbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 608c63e82a25..cd20ee73be19 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -965,7 +965,8 @@ int main(int argc, char **argv)
>      server = qio_net_listener_new();
>      if (socket_activation == 0) {
>          saddr = nbd_build_socket_address(sockpath, bindto, port);
> -        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0) {
> +        if (qio_net_listener_open_sync(server, saddr, SOMAXCONN,
> +                                       &local_err) < 0) {

This addresses qemu-nbd, but surely we want to be consistent with the
QMP  nbd-server-start impl too, in blockdev-nbd.c

>              object_unref(OBJECT(server));
>              error_report_err(local_err);
>              exit(EXIT_FAILURE);

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


