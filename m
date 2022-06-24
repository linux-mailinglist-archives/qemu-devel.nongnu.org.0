Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA43559710
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:56:28 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4g39-0001To-9E
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4g0f-0008NQ-7J
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4g0b-0002JI-Ry
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656064428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpgWEwO747QnaYNtIKBe9kEpUGqw6c8srgHJ7Tsgxbs=;
 b=YDf6A8ZZeWrUBsGfA4oxPEctBQQpxBpXFDxcvPshCkpJmo0rbKdCgSJFnOjNzt5IFQUNzI
 hEDoSuOA2e5Qgx3dxMFP7yMd2J9LxIuaC2ihzJP+kmb7ckoTJByUZNyb6vAZ3H8AqZQyFL
 ZHLcOBKZMPEZz+6UWedoydurjSr4mW0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-DaO7D2N-MeSP1H1p3zxLfA-1; Fri, 24 Jun 2022 05:53:47 -0400
X-MC-Unique: DaO7D2N-MeSP1H1p3zxLfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F13518188A2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:53:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D57C3C28124;
 Fri, 24 Jun 2022 09:53:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 979F721E690D; Fri, 24 Jun 2022 11:53:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v4 04/11] qapi: net: add stream and dgram netdevs
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-5-lvivier@redhat.com>
Date: Fri, 24 Jun 2022 11:53:45 +0200
In-Reply-To: <20220623155317.675932-5-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 23 Jun 2022 17:53:10 +0200")
Message-ID: <87zgi29yl2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Laurent Vivier <lvivier@redhat.com> writes:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>
> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
> according to the IP address type.
> "listen" and "connect" modes are managed by stream netdev. An optional
> parameter "server" defines the mode (server by default)
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---

[...]

> diff --git a/net/hub.c b/net/hub.c
> index 1375738bf121..67ca53485638 100644
> --- a/net/hub.c
> +++ b/net/hub.c
> @@ -313,6 +313,8 @@ void net_hub_check_clients(void)
>              case NET_CLIENT_DRIVER_USER:
>              case NET_CLIENT_DRIVER_TAP:
>              case NET_CLIENT_DRIVER_SOCKET:
> +            case NET_CLIENT_DRIVER_STREAM:
> +            case NET_CLIENT_DRIVER_DGRAM:
>              case NET_CLIENT_DRIVER_VDE:
>              case NET_CLIENT_DRIVER_VHOST_USER:
>                  has_host_dev = 1;
> diff --git a/net/meson.build b/net/meson.build
> index 754e2d1d405c..896d86d43914 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -13,6 +13,8 @@ softmmu_ss.add(files(
>    'net.c',
>    'queue.c',
>    'socket.c',
> +  'stream.c',
> +  'dgram.c',
>    'util.c',
>  ))
>  
> diff --git a/net/net.c b/net/net.c
> index 531e6c5d2056..1295eb946b7a 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -48,6 +48,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/option.h"
> +#include "qemu/keyval.h"
>  #include "qapi/error.h"
>  #include "qapi/opts-visitor.h"
>  #include "sysemu/runstate.h"
> @@ -1014,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>  #endif
>          [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>          [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
> +        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
> +        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
>  #ifdef CONFIG_VDE
>          [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
>  #endif
> @@ -1101,6 +1104,8 @@ void show_netdevs(void)
>      int idx;
>      const char *available_netdevs[] = {
>          "socket",
> +        "stream",
> +        "dgram",
>          "hubport",
>          "tap",
>  #ifdef CONFIG_SLIRP
> @@ -1612,7 +1617,34 @@ void net_init_clients(void)
>   */
>  bool netdev_is_modern(const char *optarg)
>  {
> -    return false;
> +    QemuOpts *opts;
> +    bool is_modern;
> +    const char *type;
> +    static QemuOptsList dummy_opts = {
> +        .name = "netdev",
> +        .implied_opt_name = "type",
> +        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
> +        .desc = { { } },
> +    };
> +
> +    if (optarg[0] == '{') {
> +        /*
> +         * detect JSON syntax. It is supported by

Start the sentence with a capital letter.

Maybe: /* This is JSON, which means it's modern syntax */

> +         * qobject_input_visitor_new_str() (modern style syntax)
> +         * but not by qemu_opts_parse_noisily() (old style syntax)
> +         */
> +        return true;
> +    }
> +
> +    opts = qemu_opts_create(&dummy_opts, NULL, false, &error_abort);
> +    qemu_opts_do_parse(opts, optarg, dummy_opts.implied_opt_name,
> +                       &error_abort);
> +    type = qemu_opt_get(opts, "type");
> +    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
> +
> +    qemu_opts_reset(&dummy_opts);
> +
> +    return is_modern;
>  }
>  
>  /*

[...]


