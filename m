Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DD31087D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:57:40 +0100 (CET)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xrv-0006KP-Hu
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7xqO-0005J9-Nx
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7xqM-0007n4-HJ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612518961;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hf20HDAPhuKrrjznAulfNd7rNt368j1XovbwPnCzYd0=;
 b=EjufZQqMwcWnpYuGn6PNWRYsxPuCwl912g23aabxF2DRM/yLkaWAjtsbxmgZdejUCrpfB2
 EUBMvssUPryqPDujJDYOiiiu7kOy4I1FIvfStARR4HucINbtW+3s0D+wHVT/6FVC9yToae
 xQF7SIMLfoA0r0DkN8lekwtcv0WjHJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-iER1bFDfOOekLc5GH-UgZQ-1; Fri, 05 Feb 2021 04:55:59 -0500
X-MC-Unique: iER1bFDfOOekLc5GH-UgZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACB9D18A083A;
 Fri,  5 Feb 2021 09:55:58 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AB441050E;
 Fri,  5 Feb 2021 09:55:51 +0000 (UTC)
Date: Fri, 5 Feb 2021 09:55:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] sockets: Use SOMAXCONN for Unix socket listen()
Message-ID: <20210205095548.GC908621@redhat.com>
References: <20210204222018.1432848-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204222018.1432848-1-eblake@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 04:20:18PM -0600, Eric Blake wrote:
> Our default of a backlog of 1 connection is rather puny, particularly
> for scenarios where we expect multiple listeners to connect (such as
> qemu-nbd -e X).  For Unix sockets, there's no real harm in supporting
> a larger backlog, and a definite benefit to the clients: at least on
> Linux, a client trying to connect to a Unix socket with a backlog gets
> an EAGAIN failure with no way to poll() for when the backlog is no
> longer present short of sleeping an arbitrary amount of time before
> retrying.
> 
> See https://bugzilla.redhat.com/1925045 for a demonstration of where
> our low backlog prevents libnbd from connecting as many parallel
> clients as it wants.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  util/qemu-sockets.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15c6..a7573e9f0fda 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1059,7 +1059,7 @@ int unix_listen(const char *str, Error **errp)
> 
>      saddr = g_new0(UnixSocketAddress, 1);
>      saddr->path = g_strdup(str);
> -    sock = unix_listen_saddr(saddr, 1, errp);
> +    sock = unix_listen_saddr(saddr, SOMAXCONN, errp);
>      qapi_free_UnixSocketAddress(saddr);
>      return sock;
>  }

This method is a legacy back compat function, only used by the QEMU
guest agent, so this can't explain the NBD problems, which use the
QIONetListener class.

IOW, the problem is in the qemu-nbd.c / blockdev-nbd.c code I believe


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


