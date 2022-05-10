Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D6522641
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 23:25:49 +0200 (CEST)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noXMZ-0004ZM-OB
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 17:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noXLH-0003or-EM
 for qemu-devel@nongnu.org; Tue, 10 May 2022 17:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noXLE-0003Mq-7r
 for qemu-devel@nongnu.org; Tue, 10 May 2022 17:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652217862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQ/eCI9Lg/GlU0E7kr1ieJ6JCxfTJ4O4hhXcdpA5OLQ=;
 b=CGrPJtwrNxe1aI6Vzi3JZaTyE4v7PKwnvMltTRJF+y+bEf8eRF2Q6jTh4V75cFoCygN3Il
 woBFPLrYo1Ly5KKzuVFc0dKU7EUBAsmucO88R3NpRj0B+GLPZaXiGFKg2CVtQZDs1fl+H5
 US2GByqH6jrOeuC+STSZMAAJZsEAd/A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-g4vc3bg2On20rS3hDwn8sg-1; Tue, 10 May 2022 17:24:18 -0400
X-MC-Unique: g4vc3bg2On20rS3hDwn8sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C3AB1C068DE;
 Tue, 10 May 2022 21:24:18 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B602166B2F;
 Tue, 10 May 2022 21:24:17 +0000 (UTC)
Date: Tue, 10 May 2022 23:24:07 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 1/6] net: introduce convert_host_port()
Message-ID: <20220510232407.6639cace@elisabeth>
In-Reply-To: <20220509173618.467207-2-lvivier@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <20220509173618.467207-2-lvivier@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  9 May 2022 19:36:13 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  include/qemu/sockets.h |  2 ++
>  net/net.c              | 62 ++++++++++++++++++++++--------------------
>  2 files changed, 34 insertions(+), 30 deletions(-)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 038faa157f59..47194b9732f8 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -47,6 +47,8 @@ void socket_listen_cleanup(int fd, Error **errp);
>  int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
>  
>  /* Old, ipv4 only bits.  Don't use for new code. */
> +int convert_host_port(struct sockaddr_in *saddr, const char *host,
> +                      const char *port, Error **errp);
>  int parse_host_port(struct sockaddr_in *saddr, const char *str,
>                      Error **errp);
>  int socket_init(void);
> diff --git a/net/net.c b/net/net.c
> index a094cf1d2929..58c05c200622 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -66,55 +66,57 @@ static QTAILQ_HEAD(, NetClientState) net_clients;
>  /***********************************************************/
>  /* network device redirectors */
>  
> -int parse_host_port(struct sockaddr_in *saddr, const char *str,
> -                    Error **errp)
> +int convert_host_port(struct sockaddr_in *saddr, const char *host,
> +                      const char *port, Error **errp)
>  {
> -    gchar **substrings;
>      struct hostent *he;
> -    const char *addr, *p, *r;
> -    int port, ret = 0;
> +    const char *r;
> +    long p;
>  
>      memset(saddr, 0, sizeof(*saddr));
>  
> -    substrings = g_strsplit(str, ":", 2);
> -    if (!substrings || !substrings[0] || !substrings[1]) {
> -        error_setg(errp, "host address '%s' doesn't contain ':' "
> -                   "separating host from port", str);
> -        ret = -1;
> -        goto out;
> -    }
> -
> -    addr = substrings[0];
> -    p = substrings[1];
> -
>      saddr->sin_family = AF_INET;
> -    if (addr[0] == '\0') {
> +    if (host[0] == '\0') {
>          saddr->sin_addr.s_addr = 0;
>      } else {
> -        if (qemu_isdigit(addr[0])) {
> -            if (!inet_aton(addr, &saddr->sin_addr)) {
> +        if (qemu_isdigit(host[0])) {
> +            if (!inet_aton(host, &saddr->sin_addr)) {

I was about to observe that this doesn't support IPv6 addresses (which
I guess we'd like to have always in the RFC 3986 form "[address]:port",
as the port is mandatory here), and to propose a small change to bridge
this gap.

Then I realised this is (partially) using GLib, so maybe we want to use
g_network_address_parse() which would, however, give us a
GSocketConnectable object.

At that point, do we want to pass the GsocketConnectable thing around,
or stick to struct sockaddr_in{,6}, filling it here from what GLib
gives us?

-- 
Stefano


