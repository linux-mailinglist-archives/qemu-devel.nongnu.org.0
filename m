Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C060103E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:32:08 +0200 (CEST)
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQDv-0001H2-Ee
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okQ5j-0002ku-02
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okQ5d-0001oP-Rd
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666013012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6LHpPs+irzkXe85yd4/kosVsQIrZAQ/OsKy5vMtWSLo=;
 b=FR0LJDbelsRcV9PEicefmfDJbXSSDyF5lFSmHx+wWNHmZgT1KEIN998RSWNYDt7kjdngis
 OygZtmmVk6Ss764wEFFy1eP6EbUKhz7Uad1zQvq+cQ0mIXXDwY/fy+xo29tS/uCXqAFRiT
 z4+48NVlu9tcJWf4wyscJc8KDW73Az0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-CRqCwp25Oc6MqzgD10q8nw-1; Mon, 17 Oct 2022 09:23:28 -0400
X-MC-Unique: CRqCwp25Oc6MqzgD10q8nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 169002800467;
 Mon, 17 Oct 2022 13:23:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B64AD2027063;
 Mon, 17 Oct 2022 13:23:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A895421E691D; Mon, 17 Oct 2022 15:23:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Jason Wang <jasowang@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Greg Kurz <groug@kaod.org>,  Eric
 Blake <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Thomas Huth
 <thuth@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Paul
 Durrant <paul@xen.org>,  David Gibson <david@gibson.dropbear.id.au>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-18-lvivier@redhat.com>
Date: Mon, 17 Oct 2022 15:23:26 +0200
In-Reply-To: <20221011200539.1486809-18-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 11 Oct 2022 22:05:39 +0200")
Message-ID: <87mt9u4m9d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Laurent Vivier <lvivier@redhat.com> writes:

> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>
> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
> address.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  net/stream.c  | 11 +++++++++--
>  qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/net/stream.c b/net/stream.c
> index 0293e38e5b57..821ae3265356 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -38,6 +38,7 @@
>  #include "io/channel.h"
>  #include "io/channel-socket.h"
>  #include "io/net-listener.h"
> +#include "qapi/qapi-events-net.h"
>  
>  typedef struct NetStreamState {
>      NetClientState nc;
> @@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
>          s->nc.link_down = true;
>          qemu_set_info_str(&s->nc, "");
>  
> +        qapi_event_send_netdev_stream_eoc(s->nc.name);
> +
>          return G_SOURCE_REMOVE;
>      }
>      buf = buf1;
> @@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
>      g_assert(addr != NULL);
>      uri = socket_uri(addr);
>      qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>      qapi_free_SocketAddress(addr);
>  
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);
>  }
>  
>  static void net_stream_server_listening(QIOTask *task, gpointer opaque)
> @@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>      g_assert(addr != NULL);
>      uri = socket_uri(addr);
>      qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>  
>      ret = qemu_socket_try_set_nonblock(sioc->fd);
>      if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
>          qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
>                            addr->u.fd.str, -ret);
> +        g_free(uri);
>          qapi_free_SocketAddress(addr);
>          goto error;
>      }
> @@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>                                              s, NULL);
>      s->nc.link_down = false;
>  
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);
> +
>      return;
>  error:
>      object_unref(OBJECT(s->ioc));
> diff --git a/qapi/net.json b/qapi/net.json
> index 6a1a49749294..69f83bceff3f 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -895,3 +895,49 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @NETDEV_STREAM_CONNECTED:
> +#
> +# Emitted when the netdev stream backend is connected
> +#
> +# @netdev-id: QEMU netdev id that is connected
> +# @uri: The Uniform Resource Identifier identifying the destination address

Is an URI the appropriate representation here?  It's not how we specify
such addresses elsewhere in QAPI/QMP...

> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
> +#
> +# or
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_CONNECTED',
> +  'data': { 'netdev-id': 'str',
> +            'uri': 'str' } }
> +
> +##
> +# @NETDEV_STREAM_EOC:

What does "EOC" mean?

Could this be named NETDEV_STREAM_DISCONNECTED, for symmetry with
NETDEV_STREAM_CONNECTED?

> +#
> +# Emitted when the netdev stream backend is disconnected
> +#
> +# @netdev-id: QEMU netdev id that is disconnected
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_EOC',
> +#      'data': {'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_EOC',
> +  'data': { 'netdev-id': 'str' } }


