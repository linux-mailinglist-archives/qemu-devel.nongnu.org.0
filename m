Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933C55FE86
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 13:29:37 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Vt2-0003vT-7Q
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 07:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Vpj-00022L-7T
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Vpf-0002ff-Vm
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656501964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TO1tLgeBK7xkBiVTv2M2kVeY+V2gdIAq/dB3BY5SVLs=;
 b=FuiMXExwD1MFQosXLi+QWPYN+gwhTaBVVCY1FWwCo+wfsXQamOAOZrebFg6GoXqV3DQSrO
 UYWlHWhcNP+J0bh6Mtbo/EwU+L8bXLYLX/kOr0tSeS51oTRdH2nDGAvbOUkxAG0upxPYV1
 L7sJtuCm8+IuxADorMYU1h4dvzFEUVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-cfQ2GBE9OuqyxGxFfe1gVA-1; Wed, 29 Jun 2022 07:26:03 -0400
X-MC-Unique: cfQ2GBE9OuqyxGxFfe1gVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7367180159B
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 11:26:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7F1C23DBF;
 Wed, 29 Jun 2022 11:26:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2CF3321E690D; Wed, 29 Jun 2022 13:26:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [RFC PATCH v4 10/11] qemu-sockets: introduce socket_uri()
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-11-lvivier@redhat.com>
Date: Wed, 29 Jun 2022 13:26:01 +0200
In-Reply-To: <20220623155317.675932-11-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 23 Jun 2022 17:53:16 +0200")
Message-ID: <871qv7hfsm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Laurent Vivier <lvivier@redhat.com> writes:

> Format a string URI from a SocketAddress.
>
> Original code from hmp-cmds.c:SocketAddress_to_str()
>
> Replace 'tcp:' by 'inet:' (because 'inet' can be also 'udp').

This one's merely misleading.

> Replace 'tcp:' by 'vsock:' with vsock socket type.

This one's positively wrong: it makes a vsock address look like an inet
address with CID misinterpreted as host.  Goes back to commit 9aca82ba31
"migration: Create socket-address parameter"

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
> index 47a27326eef7..eb0fe0a293b8 100644
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

Why do you move and rename?  I'm not objecting, I just want to know the
reason :)


