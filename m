Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559425B8F2B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 21:11:28 +0200 (CEST)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYXnD-0001LP-7G
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 15:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYXka-0006iR-IQ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 15:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYXkW-0003CV-KD
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 15:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663182518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V28+D3WiFHpJtz1E8Py3nxSa8ZHM1O06/KdF/iz1HUw=;
 b=dNFbCS7VRjfp7yxXrGS5QzqFn30Xr1wFdY3BE/wAP8mdQyEcWZkRf06s0Wiu9C/cA6dLRv
 SfIRjbdHjWu+7OaJ8+eQVjqK93JPRG1Ja9t/TZWyj8rT/9QzeCUq7BhYbQksVBsszhbjX9
 ZIPq5whlYIspiSNrbcLsE6dq1wNCdBI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-XQSBXkUhN1a70Wnem_forg-1; Wed, 14 Sep 2022 15:08:35 -0400
X-MC-Unique: XQSBXkUhN1a70Wnem_forg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so2648948wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 12:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=V28+D3WiFHpJtz1E8Py3nxSa8ZHM1O06/KdF/iz1HUw=;
 b=WDqRd93aPp0cMQSy0U562HTEJQFo2VrXEHHSF8HyCS3sdOgSpWSQAUMxPB6O2gFUs6
 lQTK3s9lLKC1lQmb32dNWdJhEHNErfSie6bOUPqpy6U319D3gMNvEMPWvExYtqwDZHeP
 0PXFvg1QdurcSGotcnEuv9BsMoHoT1BGdjJ6bD9vNUAledQ4PFeld5lItoWNVTNRo5el
 VIwo0tBiFKlsfRB0lmdf8B/i1noQ/8KOe8+b93nWQzb7fumtOvWUci+90geh2UunyPDs
 4eDN3o+H6kEZ34GX/8bb8TTrn4anyJPL6i8X/JZ2tHta9AnHE86FjsgR0NUgbF4H+KsE
 U66A==
X-Gm-Message-State: ACrzQf1bQ5uOIKTUUBUEgkKv1nI/pbjSx/V22G/GUdTI7mtSzNN8+74m
 dls7xwz3QgN7EQM6tQr0WljZaPwXK5GuxMKWUOf5X6YikNpJ2BXumqCsj623mXzcwnIbKZHmEin
 6IQOAol8A2+/gZ44=
X-Received: by 2002:a5d:584e:0:b0:22a:c99d:f687 with SMTP id
 i14-20020a5d584e000000b0022ac99df687mr2411023wrf.451.1663182514515; 
 Wed, 14 Sep 2022 12:08:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PYhoH23FZAhKcsQIwWV0X8oyuLlO2gHiQrvqaTue7++iph+sKI1ht+c3ATCM/DCrpYhiB1w==
X-Received: by 2002:a5d:584e:0:b0:22a:c99d:f687 with SMTP id
 i14-20020a5d584e000000b0022ac99df687mr2411015wrf.451.1663182514340; 
 Wed, 14 Sep 2022 12:08:34 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b003a84375d0d1sm19710924wmb.44.2022.09.14.12.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 12:08:34 -0700 (PDT)
Date: Wed, 14 Sep 2022 20:08:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 11/14] qemu-sockets: move and rename
 SocketAddress_to_str()
Message-ID: <YyImsPSlNZ5Ti6y3@work-vm>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-12-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-12-lvivier@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> Rename SocketAddress_to_str() to socket_uri() and move it to
> util/qemu-sockets.c close to socket_parse().
> 
> socket_uri() generates a string from a SocketAddress while
> socket_parse() generates a SocketAddress from a string.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/qemu/sockets.h |  2 +-
>  monitor/hmp-cmds.c     | 23 +----------------------
>  util/qemu-sockets.c    | 20 ++++++++++++++++++++
>  3 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 47194b9732f8..e5a06d2e3729 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -40,6 +40,7 @@ NetworkAddressFamily inet_netfamily(int family);
>  int unix_listen(const char *path, Error **errp);
>  int unix_connect(const char *path, Error **errp);
>  
> +char *socket_uri(SocketAddress *addr);
>  SocketAddress *socket_parse(const char *str, Error **errp);
>  int socket_connect(SocketAddress *addr, Error **errp);
>  int socket_listen(SocketAddress *addr, int num, Error **errp);
> @@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
>   * Return 0 on success.
>   */
>  int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
> -
>  #endif /* QEMU_SOCKETS_H */
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c6cd6f91dde6..cb35059c2d45 100644
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
> @@ -380,7 +359,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>          monitor_printf(mon, "socket address: [\n");
>  
>          for (addr = info->socket_address; addr; addr = addr->next) {
> -            char *s = SocketAddress_to_str(addr->value);
> +            char *s = socket_uri(addr->value);
>              monitor_printf(mon, "\t%s\n", s);
>              g_free(s);
>          }
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 83f4bd6fd211..9f6f655fd526 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1077,6 +1077,26 @@ int unix_connect(const char *path, Error **errp)
>      return sock;
>  }
>  
> +char *socket_uri(SocketAddress *addr)
> +{
> +    switch (addr->type) {
> +    case SOCKET_ADDRESS_TYPE_INET:
> +        return g_strdup_printf("tcp:%s:%s",
> +                               addr->u.inet.host,
> +                               addr->u.inet.port);
> +    case SOCKET_ADDRESS_TYPE_UNIX:
> +        return g_strdup_printf("unix:%s",
> +                               addr->u.q_unix.path);
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        return g_strdup_printf("fd:%s", addr->u.fd.str);
> +    case SOCKET_ADDRESS_TYPE_VSOCK:
> +        return g_strdup_printf("tcp:%s:%s",
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
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


