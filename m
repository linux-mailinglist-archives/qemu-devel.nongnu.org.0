Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B2561683
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:38:44 +0200 (CEST)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qdH-0004O7-V7
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6qaR-0002Yn-8K
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:35:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6qaP-0002JE-Mj
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656581745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0qVtw/VogA4ViYU2HmwmvykYZI/vfX110iYDh1L8dm4=;
 b=hCZsNC3ARGak3hRDEuHys2v9uDs0xTbwjrDWdHuJoXSK/Lrtiwj7c5DgIb++9EYMF4e4vI
 0qLmQRQNn/mvTx0wbAPWqDwf6loRQc3jtxoSZjHnGpIaMwebo+WXihiACBWt32YTc+IIRO
 321LM0TqmFiBN+aUXy4EgxJGPyjiPMY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-tRwjp4TUNym98e7c26f8ig-1; Thu, 30 Jun 2022 05:35:43 -0400
X-MC-Unique: tRwjp4TUNym98e7c26f8ig-1
Received: by mail-wr1-f70.google.com with SMTP id
 z11-20020a056000110b00b0021b9c009d09so2972196wrw.17
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 02:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0qVtw/VogA4ViYU2HmwmvykYZI/vfX110iYDh1L8dm4=;
 b=MzWkg/+muazbf5yaJgEJgj8XY4/NLygX3bo8meil1enV8CR839YToKaw6q4onr7MgA
 2MQUo4V4K3XzfJma/feGQzvkqWsCDjnFonOfDRb3B9TmzrfS6lzcjO3cNt+Pvn+N880U
 Z/Z3dk+rYyls0Uven+EIs0spa7abyzYRMJD/5nwruTLZOoED/0o6c0hZQwyUPB9KvQdj
 6yCi5HAA6QEsGSHpyqRfqcfitw0Jp6WE7JU1VnoFxu6fczQaTMKme01AtK5X8n4DhDQo
 hFEuNdXXYjURsv2R2GhCwBggHL5Vd27hqnr1pG8bRY1rXoiKmmRgaaZNvIJX7Papdj/X
 4Ypg==
X-Gm-Message-State: AJIora9mkOzgHipvFQfSDOenTMa0OXQvbbvnx0UrMYCYvN47A6I4iYkF
 +Eg7UGRXi0tCSztLYYm3aDV88zSOj6juPVe1uhuZRlU6DMdK7td+AfFuQ8ym7MswYppqu7N9SYH
 ZvT6iIcc7Npm44O8=
X-Received: by 2002:a05:600c:210a:b0:3a0:3be1:fb8b with SMTP id
 u10-20020a05600c210a00b003a03be1fb8bmr8883349wml.195.1656581742719; 
 Thu, 30 Jun 2022 02:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPK2d3htru3C77WSn1cKPgzTRNsZoiQ/aHVYOjd8ZFSKv701qWsdlOTNkvmxxX3aHr/uAxNw==
X-Received: by 2002:a05:600c:210a:b0:3a0:3be1:fb8b with SMTP id
 u10-20020a05600c210a00b003a03be1fb8bmr8883309wml.195.1656581742451; 
 Thu, 30 Jun 2022 02:35:42 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b0021b956da1dcsm18912761wrr.113.2022.06.30.02.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 02:35:41 -0700 (PDT)
Date: Thu, 30 Jun 2022 10:35:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 11/12] qemu-sockets: introduce socket_uri()
Message-ID: <Yr1uayTXpxVASlk7@work-vm>
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-12-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627154749.871943-12-lvivier@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Laurent Vivier (lvivier@redhat.com) wrote:
> Format a string URI from a SocketAddress.
> 
> Original code from hmp-cmds.c:SocketAddress_to_str()
> 
> Replace 'tcp:' by 'inet:' (because 'inet' can be also 'udp').

I think that's OK, it'll look a little odd in migration where
the syntax for a migration URI is tcp: (and is a tcp stream)
and then when you 'info migrate', which is where this is origianlly
used, it turns into inet.

> Replace 'tcp:' by 'vsock:' with vsock socket type.

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/qemu/sockets.h |  2 +-
>  monitor/hmp-cmds.c     | 23 +----------------------
>  util/qemu-sockets.c    | 20 ++++++++++++++++++++
>  3 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 47194b9732f8..3e2ae7e21705 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -41,6 +41,7 @@ int unix_listen(const char *path, Error **errp);
>  int unix_connect(const char *path, Error **errp);
>  
>  SocketAddress *socket_parse(const char *str, Error **errp);
> +char *socket_uri(SocketAddress *addr);
>  int socket_connect(SocketAddress *addr, Error **errp);
>  int socket_listen(SocketAddress *addr, int num, Error **errp);
>  void socket_listen_cleanup(int fd, Error **errp);
> @@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
>   * Return 0 on success.
>   */
>  int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
> -
>  #endif /* QEMU_SOCKETS_H */
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ca98df04952b..8ebb437d1b6a 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -197,27 +197,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
>      qapi_free_MouseInfoList(mice_list);
>  }
>  
> -static char *SocketAddress_to_str(SocketAddress *addr)
> -{
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET:
> -        return g_strdup_printf("tcp:%s:%s",
> -                               addr->u.inet.host,
> -                               addr->u.inet.port);
> -    case SOCKET_ADDRESS_TYPE_UNIX:
> -        return g_strdup_printf("unix:%s",
> -                               addr->u.q_unix.path);
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        return g_strdup_printf("fd:%s", addr->u.fd.str);
> -    case SOCKET_ADDRESS_TYPE_VSOCK:
> -        return g_strdup_printf("tcp:%s:%s",
> -                               addr->u.vsock.cid,
> -                               addr->u.vsock.port);
> -    default:
> -        return g_strdup("unknown address type");
> -    }
> -}
> -
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> @@ -375,7 +354,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>          monitor_printf(mon, "socket address: [\n");
>  
>          for (addr = info->socket_address; addr; addr = addr->next) {
> -            char *s = SocketAddress_to_str(addr->value);
> +            char *s = socket_uri(addr->value);
>              monitor_printf(mon, "\t%s\n", s);
>              g_free(s);
>          }
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 13b5b197f9ea..4efc2ce8b074 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1098,6 +1098,26 @@ int unix_connect(const char *path, Error **errp)
>      return sock;
>  }
>  
> +char *socket_uri(SocketAddress *addr)
> +{
> +    switch (addr->type) {
> +    case SOCKET_ADDRESS_TYPE_INET:
> +        return g_strdup_printf("inet:%s:%s",
> +                               addr->u.inet.host,
> +                               addr->u.inet.port);
> +    case SOCKET_ADDRESS_TYPE_UNIX:
> +        return g_strdup_printf("unix:%s",
> +                               addr->u.q_unix.path);
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        return g_strdup_printf("fd:%s", addr->u.fd.str);
> +    case SOCKET_ADDRESS_TYPE_VSOCK:
> +        return g_strdup_printf("vsock:%s:%s",
> +                               addr->u.vsock.cid,
> +                               addr->u.vsock.port);
> +    default:
> +        return g_strdup("unknown address type");
> +    }
> +}
>  
>  SocketAddress *socket_parse(const char *str, Error **errp)
>  {
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


