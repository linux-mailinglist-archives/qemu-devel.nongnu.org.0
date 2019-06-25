Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536305508B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 15:39:31 +0200 (CEST)
Received: from localhost ([::1]:60308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hflfW-0005JH-6d
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 09:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57983)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hflZK-0002mR-Gt
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:33:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hflZI-0000UQ-7c
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:33:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36758)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hflZ6-0000MX-Oe
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:32:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49A5230821AE;
 Tue, 25 Jun 2019 13:32:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7F460C4C;
 Tue, 25 Jun 2019 13:32:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A5B611386A0; Tue, 25 Jun 2019 15:32:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20190614173140.19159-1-vsementsov@virtuozzo.com>
Date: Tue, 25 Jun 2019 15:32:31 +0200
In-Reply-To: <20190614173140.19159-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 14 Jun 2019 20:31:40 +0300")
Message-ID: <87v9wtn634.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 25 Jun 2019 13:32:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] qapi: Add InetSocketAddress member
 keep-alive
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
Cc: den@openvz.org, kraxel@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I apologize for dragging my feet on this review.

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> It's needed to provide keepalive for nbd client to track server
> availability.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>
> v3: [by Markus's comments]
>
> - Fix commit subject
> - Add comment to qapi and restrict server-side connections
> - Fix s/"keep-alive="/",keep-alive"/
>
>
>  qapi/sockets.json   |  6 +++++-
>  util/qemu-sockets.c | 28 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/sockets.json b/qapi/sockets.json
> index fc81d8d5e8..c44af481a1 100644
> --- a/qapi/sockets.json
> +++ b/qapi/sockets.json
> @@ -53,6 +53,9 @@
>  #
>  # @ipv6: whether to accept IPv6 addresses, default try both IPv4 and IPv6
>  #
> +# @keep-alive: enable keep-alive when connecting to this socket. Not supported
> +#              for server-side connections. (Since 4.1)
> +#

Is "server-side connection" is an established term?

For what it's worth, "passive socket" is, see listen(2).

>  # Since: 1.3
>  ##
>  { 'struct': 'InetSocketAddress',
> @@ -61,7 +64,8 @@
>      '*numeric':  'bool',
>      '*to': 'uint16',
>      '*ipv4': 'bool',
> -    '*ipv6': 'bool' } }
> +    '*ipv6': 'bool',
> +    '*keep-alive': 'bool' } }
>  
>  ##
>  # @UnixSocketAddress:
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8850a280a8..813063761b 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -438,6 +438,12 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
>      struct addrinfo *res, *e;
>      int sock = -1;
>  
> +    if (saddr->keep_alive) {
> +        error_setg(errp, "keep-alive options is not supported for server-side "
> +                   "connection");
> +        return -1;
> +    }
> +
>      res = inet_parse_connect_saddr(saddr, errp);
>      if (!res) {
>          return -1;

I'm afraid you added this to the wrong function; ...

> @@ -457,6 +463,19 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
>      }
>  
>      freeaddrinfo(res);
> +
> +    if (saddr->keep_alive) {

... it renders this code unreachable.

I guess the "not supported for passive sockets" check should go into
inet_listen_saddr() instead.

> +        int val = 1;
> +        int ret = qemu_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
> +                                  &val, sizeof(val));
> +
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
> +            close(sock);
> +            return -1;
> +        }
> +    }
> +
>      return sock;
>  }
>  
> @@ -652,6 +671,15 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
>          }
>          addr->has_ipv6 = true;
>      }
> +    begin = strstr(optstr, ",keep-alive");
> +    if (begin) {
> +        if (inet_parse_flag("keep-alive", begin + strlen(",keep-alive"),
> +                            &addr->keep_alive, errp) < 0)
> +        {
> +            return -1;
> +        }
> +        addr->has_keep_alive = true;
> +    }
>      return 0;
>  }

