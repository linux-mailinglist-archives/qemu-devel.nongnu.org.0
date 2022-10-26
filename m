Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A160E976
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:46:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmFr-0004qD-EQ; Wed, 26 Oct 2022 15:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmFm-0004px-D8
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmFd-0005bB-SX
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666813185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUFP9VXXAZ+kSQdE/F04mInbZThaEABWviF23B44Qo8=;
 b=X0qJ9Kz2fY7O+7iAbdBX83JuEP5Z9lY3FO6uaJ+NndM7E0bVO8kAvV1ytSYi+jD4MFQ+xw
 n9OfnmdxZ4fh3A/bj3HvHRwQyvGBzIjzIy2o0RdiTZaY6sugOu9lDiR8csVnN3URVXjN6/
 sqLPK6hsL5vhmGt9ifmAjdtBoBDPHDI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-hCQEEwQVPu2mxXwLxfyQFA-1; Wed, 26 Oct 2022 15:39:43 -0400
X-MC-Unique: hCQEEwQVPu2mxXwLxfyQFA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so1761310wmb.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zUFP9VXXAZ+kSQdE/F04mInbZThaEABWviF23B44Qo8=;
 b=q3/o74tIZ50Qny3v2BmXYuefnS+pSmUD1gxg1Fpel+QviwDs0+ZbKaTGUdi7xVz9Dv
 9i06Mg/LtAeQR0YKg7hxc0nmiNcWAxQuBtDH2QdcL4feUF9WJnZlCyyQyYNDX45wCMXd
 Qgy+fydxsQFkC58/0STV5z/ZkGuPXeZbzP1x0Qahq3DQSLuCalcYTxcIdT4VY9mxp8IU
 l0egCeM+q2o9w7yvan2+7H0ks/JqHdn86/fxzx5HlhfCQdr88bqgKWZJbLv07lAzWIcT
 nBEVWBG+AfbGdBqDXZpDhxorbM+0XUU4bjPh6wc1y6yhmkoX3vZjoDa5MFoirLx9PCQB
 Honw==
X-Gm-Message-State: ACrzQf2u/k0TKIkjgDPPkh3Sr84RbKGvz+fHa8u94HQbVwFthvVuFTtC
 AQhQkPrrCCmGLNXMU5f1smzSju3ICWuFVYj9BC698c5BXd+fw61/vM7MsNc8wby8atI0Gil8XEX
 rtgTHHowhix/ngfU=
X-Received: by 2002:a05:600c:4e8a:b0:3c6:de26:9d6e with SMTP id
 f10-20020a05600c4e8a00b003c6de269d6emr3615250wmq.117.1666813182422; 
 Wed, 26 Oct 2022 12:39:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XpfNr5DFiR2iaFQU1FRspM6+jmQxlo4TAtOlDYDi8YgHu1uoAKiKMqXZOqN6x/jK6CdR3jg==
X-Received: by 2002:a05:600c:4e8a:b0:3c6:de26:9d6e with SMTP id
 f10-20020a05600c4e8a00b003c6de269d6emr3615242wmq.117.1666813182194; 
 Wed, 26 Oct 2022 12:39:42 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b0022ae401e9e0sm6243967wrc.78.2022.10.26.12.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:39:41 -0700 (PDT)
Date: Wed, 26 Oct 2022 15:39:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Greg Kurz <groug@kaod.org>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v11 00/17] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20221026153926-mutt-send-email-mst@kernel.org>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 11, 2022 at 10:05:22PM +0200, Laurent Vivier wrote:
> "-netdev socket" only supports inet sockets.
> 
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.


Acked-by: Michael S. Tsirkin <mst@redhat.com>


this is Jason's area though.

> As discussed in:
> 
>   "socket.c added support for unix domain socket datagram transport"
>   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> 
> This series adds support of unix socket type using SocketAddress QAPI structure.
> 
> Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> backend but they use the SocketAddress QAPI to provide socket parameters.
> And then they also implement unix sockets (TCP and UDP).
> 
> Some examples of CLI syntax:
> 
>   for TCP:
> 
>   -netdev stream,id=socket0,addr.type=inet,addr.host=localhost,addr.port=1234
>   -netdev stream,id=socket0,server=off,addr.type=inet,addr.host=localhost,addr.port=1234
> 
>   -netdev dgram,id=socket0,\
>           local.type=inet,local.host=localhost,local.port=1234,\
>           remote.type=inet,remote.host=localhost,remote.port=1235
> 
>   for UNIX:
> 
>   -netdev stream,id=socket0,addr.type=unix,addr.path=/tmp/qemu0
>   -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=/tmp/qemu0
> 
>   -netdev dgram,id=socket0,\
>           local.type=unix,local.path=/tmp/qemu0,\
>           remote.type=unix,remote.path=/tmp/qemu1
> 
>   for FD:
> 
>   -netdev stream,id=socket0,addr.type=fd,addr.str=4
>   -netdev stream,id=socket0,server=off,addr.type=fd,addr.str=5
> 
>   -netdev dgram,id=socket0,local.type=fd,addr.str=4
> 
> v11:
>   - use qemu_set_info_str() in hw/net/xen_nic.c
>   - fix link_down state in stream client mode
>   - cleanup error case in net_stream_receive()
>   - update qapi version to 7.2
> 
> v10:
>   - add Red Hat copyright
>   - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD
>   - remove redundente _stream / _dgram in functions name
>   - move net_dgram_init() into net_init_dgram()
>   - address Thomas' comments on qtest
>   - add a function qemu_set_info_str() to set info string
>   - tested stream netdev with fd type using qrap/passt and
>     "-netdev stream,addr.type=fd,server=off,addr.str=5,id=netdev0"
> 
> v9:
>   - add events to report stream connection/disconnection
>   - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()
>     net_dgram_connect() and net_dgram_send() that are only
>     needed by net/stream.c
>   - remove from net/stream.c send_fn
>   - add Red Hat copyright
>   - add original net/socket.c Stefano's patch (EINVAL)
> 
> v8:
>   - test ipv4 and ipv6 parameters (stream inet)
>   - test abstract parameter (stream unix)
>   - add SocketAddressInet supported parameters in qemu-options.hx
>     (only stream, supported by the move to QIO)
>   - with qio_channel_writev() replace (ret == -1 && errno == EAGAIN)
>     by (ret == QIO_CHANNEL_ERR_BLOCK)
> 
> v7:
>   - add qtests
>   - update parameters table in net.json
>   - update socket_uri() and socket_parse()
> 
> v6:
>   - s/netdev option/-netdev option/ PATCH 4
>   - s/ / /
>   - update @NetdevStreamOptions and @NetdevDgramOptions comments
>   - update PATCH 4 description message
>   - add missing return in error case for unix stream socket
>   - split socket_uri() patch: move and rename, then change content
> 
> v5:
>   - remove RFC prefix
>   - put the change of net_client_parse() into its own patch (exit() in the
>     function)
>   - update comments regarding netdev_is_modern() and netdev_parse_modern()
>   - update error case in net_stream_server_init()
>   - update qemu-options.hx with unix type
>   - fix HMP "info network" with unix protocol/server side.
> 
> v4:
>   - net_client_parse() fails with exit() rather than with return.
>   - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
>     own line in qapi/net.json
>   - add a comment in qapi/net.json about parameters usage
>   - move netdev_is_modern() check to qemu_init()
>   - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()
>     to parse parameters and detect type value.
>   - add a blank line after copyright comment
> 
> v3:
>   - remove support of "-net" for dgram and stream. They are only
>     supported with "-netdev" option.
>   - use &error_fatal directly in net_client_inits()
>   - update qemu-options.hx
>   - move to QIO for stream socket
> 
> v2:
>   - use "stream" and "dgram" rather than "socket-ng,mode=stream"
>     and ""socket-ng,mode=dgram"
>   - extract code to bypass qemu_opts_parse_noisily() to
>     a new patch
>   - do not ignore EINVAL (Stefano)
>   - fix "-net" option
> 
> CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> CC: Stefano Brivio <sbrivio@redhat.com>
> CC: Daniel P. Berrangé <berrange@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> 
> Laurent Vivier (15):
>   net: introduce convert_host_port()
>   net: remove the @errp argument of net_client_inits()
>   net: simplify net_client_parse() error management
>   qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
>   net: introduce qemu_set_info_str() function
>   qapi: net: add stream and dgram netdevs
>   net: stream: add unix socket
>   net: dgram: make dgram_dst generic
>   net: dgram: move mcast specific code from net_socket_fd_init_dgram()
>   net: dgram: add unix socket
>   qemu-sockets: move and rename SocketAddress_to_str()
>   qemu-sockets: update socket_uri() and socket_parse()  to be consistent
>   net: stream: move to QIO to enable additional parameters
>   tests/qtest: netdev: test stream and dgram backends
>   net: stream: add QAPI events to report connection state
> 
> Stefano Brivio (2):
>   net: socket: Don't ignore EINVAL on netdev socket connection
>   net: stream: Don't ignore EINVAL on netdev socket connection
> 
>  hmp-commands.hx             |   2 +-
>  hw/net/xen_nic.c            |   5 +-
>  include/net/net.h           |   7 +-
>  include/qemu/sockets.h      |   4 +-
>  meson                       |   2 +-
>  monitor/hmp-cmds.c          |  23 +-
>  net/clients.h               |   6 +
>  net/dgram.c                 | 622 ++++++++++++++++++++++++++++++++++++
>  net/hub.c                   |   2 +
>  net/l2tpv3.c                |   3 +-
>  net/meson.build             |   2 +
>  net/net.c                   | 186 ++++++++---
>  net/slirp.c                 |   5 +-
>  net/socket.c                |  36 +--
>  net/stream.c                | 389 ++++++++++++++++++++++
>  net/tap-win32.c             |   3 +-
>  net/tap.c                   |  13 +-
>  net/vde.c                   |   3 +-
>  net/vhost-user.c            |   3 +-
>  net/vhost-vdpa.c            |   2 +-
>  qapi/net.json               | 112 ++++++-
>  qemu-options.hx             |  14 +
>  softmmu/vl.c                |  16 +-
>  tests/qtest/meson.build     |   1 +
>  tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++
>  util/qemu-sockets.c         |  25 ++
>  26 files changed, 1771 insertions(+), 132 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>  create mode 100644 tests/qtest/netdev-socket.c
> 
> -- 
> 2.37.3
> 


