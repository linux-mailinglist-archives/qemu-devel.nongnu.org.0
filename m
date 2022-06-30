Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF1561659
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:31:31 +0200 (CEST)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qWG-000869-Ow
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6qTk-0006r2-Ob
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:28:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6qTd-0005ld-Vt
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656581320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwXaZmoYp2/82udS9JLS8mFdpiqv3marPIwbDv0wPzk=;
 b=bn843/gvhvOA2oM2KtMv5b2/RYW/zlV8c62Y6I+5AIyxg+ddnTGJQ2Z3JTDM6s3LVGXZec
 orrJxJ+5+1h2ephGXbeF249V5yweZ52AjPsORRvEdhbJHk7/b/2OayjDxNzMTCQWiZ3qnu
 0m1BOQmRb+D+7rv+1TJ46ycEY0ba3k8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-DGT9e1lxOaC77zBrL59Ckg-1; Thu, 30 Jun 2022 05:28:39 -0400
X-MC-Unique: DGT9e1lxOaC77zBrL59Ckg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso1220194wms.2
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 02:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nwXaZmoYp2/82udS9JLS8mFdpiqv3marPIwbDv0wPzk=;
 b=x7YTHOZOy6H7B/aAAvYehw8BvNecBAcdvpc4GFo1uTXJg13C6wGV0ekjFuWHn1+m5Q
 V6H16sgEdqK4RgEckerieVGPk6JK+iFvmX3lwwZEbk7YVkwMz3SVlbBJQDO1daEkhcd1
 4vXzBrHO06IOxxiniDuszdZgDdwJUyfKQiPQ4277dK0t/wteAhrrhsK84uOR3DT/5gIM
 D8YhF56W08EvFGCgsACGtP1EZW1M/Nj1W4mJUYffK3/r07E4cDaFfZShrZ9waiTHFYbC
 RjGRI4owWwm7a4bAoGuTAM/qFaEGVzDCr181gMjC5LlZCHNVRayK3KF/hWHY3NGX2Vue
 k5qQ==
X-Gm-Message-State: AJIora8QvZIV9HCLaoN3sa2MIQOMy1yN4GudTY1TTxA0KvBK8LRwgCFn
 NAAdJcmwhAlEuYUdt67Fv1sRvN1c0skXZo7cuy26oNiA5qiU33FjjAbsuTj8Un3zUp4HTLsVXkN
 NGffoElDUn5vSPnE=
X-Received: by 2002:adf:e752:0:b0:21b:80ae:9d7a with SMTP id
 c18-20020adfe752000000b0021b80ae9d7amr7346256wrn.362.1656581317938; 
 Thu, 30 Jun 2022 02:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaJTJx3xlKsDq1HA9EV9g3TY8H41ORtIEQ/LTwcMCPNJRqDWPcx/DfoJ6jOS06eC7ExF1qVg==
X-Received: by 2002:adf:e752:0:b0:21b:80ae:9d7a with SMTP id
 c18-20020adfe752000000b0021b80ae9d7amr7346234wrn.362.1656581317680; 
 Thu, 30 Jun 2022 02:28:37 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x2-20020a7bc202000000b0039c18d3fe27sm5891134wmi.19.2022.06.30.02.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 02:28:36 -0700 (PDT)
Date: Thu, 30 Jun 2022 10:28:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v5 07/12] net: stream: add unix socket
Message-ID: <Yr1swVqjE2mMoFZe@work-vm>
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-8-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627154749.871943-8-lvivier@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Laurent Vivier (lvivier@redhat.com) wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---
>  net/stream.c    | 106 +++++++++++++++++++++++++++++++++++++++++++++---
>  qemu-options.hx |   1 +
>  2 files changed, 102 insertions(+), 5 deletions(-)
> 
> diff --git a/net/stream.c b/net/stream.c
> index e8afbaca50b6..1a2bc237707e 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
>  static void net_stream_accept(void *opaque)
>  {
>      NetStreamState *s = opaque;
> -    struct sockaddr_in saddr;
> +    struct sockaddr_storage saddr;
>      socklen_t len;
>      int fd;
>  
> @@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
>      s->fd = fd;
>      s->nc.link_down = false;
>      net_stream_connect(s);
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "connection from %s:%d",
> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    switch (saddr.ss_family) {
> +    case AF_INET: {
> +        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
> +
> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> +                 "connection from %s:%d",
> +                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
> +        break;
> +    }
> +    case AF_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        len = sizeof(saddr_un);
> +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> +                 "connect from %s", saddr_un.sun_path);
> +        break;
> +    }
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
>  
>  static int net_stream_server_init(NetClientState *peer,
> @@ -295,6 +313,42 @@ static int net_stream_server_init(NetClientState *peer,
>          }
>          break;
>      }
> +    case SOCKET_ADDRESS_TYPE_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        ret = unlink(addr->u.q_unix.path);
> +        if (ret < 0 && errno != ENOENT) {
> +            error_setg_errno(errp, errno, "failed to unlink socket %s",
> +                             addr->u.q_unix.path);
> +            return -1;
> +        }
> +
> +        saddr_un.sun_family = PF_UNIX;
> +        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
> +                       addr->u.q_unix.path);
> +        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
> +            error_setg(errp, "UNIX socket path '%s' is too long",
> +                       addr->u.q_unix.path);
> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
> +                              sizeof(saddr_un.sun_path));

return here?
> +
> +        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create stream socket");
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "can't create socket with path: %s",
> +                             saddr_un.sun_path);
> +            closesocket(fd);
> +            return -1;
> +        }
> +        break;
> +    }
>      case SOCKET_ADDRESS_TYPE_FD:
>          fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>          if (fd == -1) {
> @@ -380,6 +434,48 @@ static int net_stream_client_init(NetClientState *peer,
>                                     ntohs(saddr_in.sin_port));
>          break;
>      }
> +    case SOCKET_ADDRESS_TYPE_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        saddr_un.sun_family = PF_UNIX;
> +        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
> +                       addr->u.q_unix.path);
> +        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
> +            error_setg(errp, "UNIX socket path '%s' is too long",
> +                       addr->u.q_unix.path);
> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
> +                              sizeof(saddr_un.sun_path));

and here

(Can you not do a lot of this just by calling util/qemu-sockets.c
unix_connect?)

> +        }
> +
> +        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create stream socket");
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        connected = 0;
> +        for (;;) {
> +            ret = connect(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
> +            if (ret < 0) {
> +                if (errno == EINTR || errno == EWOULDBLOCK) {
> +                    /* continue */
> +                } else if (errno == EAGAIN ||
> +                           errno == EALREADY) {
> +                    break;
> +                } else {
> +                    error_setg_errno(errp, errno, "can't connect socket");
> +                    closesocket(fd);
> +                    return -1;
> +                }
> +            } else {
> +                connected = 1;
> +                break;
> +            }
> +        }
> +        info_str = g_strdup_printf(" connect to %s", saddr_un.sun_path);
> +        break;
> +    }
>      case SOCKET_ADDRESS_TYPE_FD:
>          fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>          if (fd == -1) {
> @@ -395,7 +491,7 @@ static int net_stream_client_init(NetClientState *peer,
>          info_str = g_strdup_printf("connect to fd %d", fd);
>          break;
>      default:
> -        error_setg(errp, "only support inet or fd type");
> +        error_setg(errp, "only support inet, unix or fd type");
>          return -1;
>      }
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2be0cbd2549b..23ff12c1b183 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2723,6 +2723,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "                configure a network backend to connect to another network\n"
>      "                using an UDP tunnel\n"
>      "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
>      "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>      "                configure a network backend to connect to another network\n"
>      "                using a socket connection in stream mode.\n"
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


