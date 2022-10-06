Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E35F6562
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:48:28 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogPMY-0002vi-Kk
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogOw9-00073n-UF
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogOw2-0006ed-F3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665055260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRypsCRR4ra913jPAeQLSPgYrboGHFis297PGvUBvTc=;
 b=OsK0sjdE+P2Ir4HKt9Uj93tBAvv76CJlt0tGF9o36ndIOoB5EOfugrcaz9nqosKqDGc2+i
 hbUJcY9ZAfLkE9OpFaWY+jd65ZMHU6bMnA1pvEfwi9IQ6TTAYoTvoF/QkibpHb6tZhFW+C
 PoN76EqxGz8HOTp7bHr0i7JtlqDBps4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-7BqrIVbXP-yQRdxMyyCp8Q-1; Thu, 06 Oct 2022 07:20:59 -0400
X-MC-Unique: 7BqrIVbXP-yQRdxMyyCp8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 h129-20020a1c2187000000b003be5419a7e4so245110wmh.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 04:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eRypsCRR4ra913jPAeQLSPgYrboGHFis297PGvUBvTc=;
 b=6H+hYq0ufe2xKfo0Wb1VovqT1XLJVvvYzeXuf7ngFWMxDPokLMICCYnYXOopmholus
 FfjjqtoDFJP719O0HzW3tmXSY0J2iFziY5CV/PKKm/AnC9E3j7oXTdDwbUzjgiU8KQqO
 nBfVA3w+HDU9MQ+h5RNanDzyYnDOX3da9KedNJpjNCuXS5ieblrfL/vNuT6/G8kbGjzb
 Yo3juT+RcEEQl+PRlr3EGDl2BqpBn+4Ef5W3IqcwpJkgLS0u6+usPhQSGnY5DGRKEyVF
 MJImCc1THJLp8X0k29uvZdy5nf1kEstjUXPJ7KJslDiv1LOvYGBYjxA+IpHUQQMhfNDo
 0/nA==
X-Gm-Message-State: ACrzQf23r0CBqGg3e21Z4X/wg1B2sfz5rOvYs/wII/D4OUXl6QH+NhLd
 do/FnqwQum42EzNXUCLmBnibLXIFThxrp2FMKuTTBvt0TGT9uh3cVlUJCW5rzSBC1Wx288tvKQr
 PEV8pbzLl00xF0HE=
X-Received: by 2002:a5d:59c7:0:b0:229:b76f:e2bf with SMTP id
 v7-20020a5d59c7000000b00229b76fe2bfmr2690691wry.128.1665055258768; 
 Thu, 06 Oct 2022 04:20:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69/6z+ZT0xkIsfK9pbi22PaTJrEZVuwr/UeVp5CDdQ9uapDOvBHmMwfgeS+qVpxScXxwVDEg==
X-Received: by 2002:a5d:59c7:0:b0:229:b76f:e2bf with SMTP id
 v7-20020a5d59c7000000b00229b76fe2bfmr2690663wry.128.1665055258543; 
 Thu, 06 Oct 2022 04:20:58 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 bg34-20020a05600c3ca200b003a6a3595edasm4790692wmb.27.2022.10.06.04.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 04:20:58 -0700 (PDT)
Date: Thu, 6 Oct 2022 07:20:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v10 00/17] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20221006071948-mutt-send-email-mst@kernel.org>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 05, 2022 at 06:20:34PM +0200, Laurent Vivier wrote:
> "-netdev socket" only supports inet sockets.
> 
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.

Looks good.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Belongs in Jason's tree.

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
>  include/net/net.h           |   7 +-
>  include/qemu/sockets.h      |   4 +-
>  monitor/hmp-cmds.c          |  23 +-
>  net/clients.h               |   6 +
>  net/dgram.c                 | 622 ++++++++++++++++++++++++++++++++++++
>  net/hub.c                   |   2 +
>  net/l2tpv3.c                |   3 +-
>  net/meson.build             |   2 +
>  net/net.c                   | 186 ++++++++---
>  net/slirp.c                 |   5 +-
>  net/socket.c                |  36 +--
>  net/stream.c                | 382 ++++++++++++++++++++++
>  net/tap-win32.c             |   3 +-
>  net/tap.c                   |  13 +-
>  net/vde.c                   |   3 +-
>  net/vhost-user.c            |   3 +-
>  net/vhost-vdpa.c            |   2 +-
>  qapi/net.json               | 108 ++++++-
>  qemu-options.hx             |  14 +
>  softmmu/vl.c                |  16 +-
>  tests/qtest/meson.build     |   1 +
>  tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++
>  util/qemu-sockets.c         |  25 ++
>  24 files changed, 1757 insertions(+), 128 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>  create mode 100644 tests/qtest/netdev-socket.c
> 
> -- 
> 2.37.3
> 


