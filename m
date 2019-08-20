Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22208959D4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 10:40:14 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzzgb-0001b5-96
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 04:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1hzzfp-00017L-EI
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:39:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hzzfn-00088z-Mn
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:39:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hzzfk-00083D-E5; Tue, 20 Aug 2019 04:39:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7919F300BEA4;
 Tue, 20 Aug 2019 08:39:19 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 916AA1F5;
 Tue, 20 Aug 2019 08:39:07 +0000 (UTC)
Date: Tue, 20 Aug 2019 09:39:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190820083904.GA23352@redhat.com>
References: <20190820082459.2101-1-quintela@redhat.com>
 <20190820082459.2101-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190820082459.2101-2-quintela@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 20 Aug 2019 08:39:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/5] socket: Add backlog parameter to
 socket_listen
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 10:24:55AM +0200, Juan Quintela wrote:
> Current parameter was always one.  We continue with that value for now
> in all callers.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  include/qemu/sockets.h    |  2 +-
>  io/channel-socket.c       |  2 +-
>  qga/channel-posix.c       |  2 +-
>  tests/test-util-sockets.c | 12 ++++++------
>  util/qemu-sockets.c       | 33 ++++++++++++++++++++++-----------
>  util/trace-events         |  2 ++
>  6 files changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index e3a1666578..3f0a80404f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -31,6 +31,7 @@
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qobject-output-visitor.h"
>  #include "qemu/cutils.h"
> +#include "trace.h"
>  
>  #ifndef AI_ADDRCONFIG
>  # define AI_ADDRCONFIG 0
> @@ -207,6 +208,7 @@ static int try_bind(int socket, InetSocketAddress *saddr, struct addrinfo *e)
>  
>  static int inet_listen_saddr(InetSocketAddress *saddr,
>                               int port_offset,
> +                             int num,
>                               Error **errp)
>  {
>      struct addrinfo ai,*res,*e;
> @@ -309,7 +311,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>                      goto listen_failed;
>                  }
>              } else {
> -                if (!listen(slisten, 1)) {
> +                trace_inet_listen_saddr(num);

It is a bit odd to only have the trace event for inet sockets. I'd
prefer it in the caller for all sockets, with just "socket_listen"
name.

> +                if (!listen(slisten, num)) {
>                      goto listen_ok;
>                  }
>                  if (errno != EADDRINUSE) {

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

