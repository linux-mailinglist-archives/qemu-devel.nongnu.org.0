Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C95B8F24
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 21:08:25 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYXkF-0006bA-6A
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 15:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYXiv-00050G-J0
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 15:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYXir-00034e-TC
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 15:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663182415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CenzCs9EAvsbT3nL4zJmaDS7A3l3iwsUwPNOiqVECI0=;
 b=UWYPuvKC8jyBZwcQ+c4VUVNNxi9W+Vz1CQqOA1M1IPam4r45qpzFZdq44nV3X5zPPkO3gU
 TCm1RxhU74OCVeYu0NZYr86yl9iv+i1+8xro/PTqygTta2wkAv6tECXp0S5OfGQ2zXeMGu
 sAP7eDPC3FStou0NRyZljOcYS76R1mw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-paidq6RhNxyrKppJF8hq5A-1; Wed, 14 Sep 2022 15:06:53 -0400
X-MC-Unique: paidq6RhNxyrKppJF8hq5A-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so1970674wmb.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 12:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CenzCs9EAvsbT3nL4zJmaDS7A3l3iwsUwPNOiqVECI0=;
 b=0DZQVlnIK5qJabOSdFapmI36W/ZWzcvdS1JA032AovTmQ17f/BSUsQO0Ius9EtmyKj
 zpWxZh6XgBrB9UNhaLYdMvPTJ+MLAPjK8taBR3OLwZnF3J71RB+UxXOfw7MrBxjFsI1H
 D8rcPaIAwOzHeDcq1HZVW0PcDCf+8pCL4WHUbuGekpkwToZeqd5mawq3rkYRx0030YSi
 xwtP9PYQ2s3+K/AKcBg9bWGiZMlGLkhyP4BzFCXHX/sI4E4I20duzOmcqsFUIBafGEIa
 +293TFFgd3KgXkmAacN4QFXmh2j1k36io43xX8qXut3iTJxBxV6sV1LMN6zo6Ch3dWY9
 PFhA==
X-Gm-Message-State: ACgBeo2p2hCZTTeJsvSqYkHef9cn9LKsbEbr7oLlbUETdQchU8vSCCvC
 b6Vr0hHJdmMfXXDQNCXLTOcqOUxKOFRNCwkpWA1p4ohAjUmnKzJBMTUvAEe+ao1xRoSgIWu6FOB
 mi2P2aipZLjY97Ww=
X-Received: by 2002:a05:600c:4fc4:b0:3a5:c9ed:ca2 with SMTP id
 o4-20020a05600c4fc400b003a5c9ed0ca2mr4279516wmq.73.1663182412642; 
 Wed, 14 Sep 2022 12:06:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4FPcyx0SiYKRJeSAOKq71wRmPh2Mba3Qnz4bIGNp4nomb4gcJOK4yuPhmKeEXgck+GhKEKIw==
X-Received: by 2002:a05:600c:4fc4:b0:3a5:c9ed:ca2 with SMTP id
 o4-20020a05600c4fc400b003a5c9ed0ca2mr4279489wmq.73.1663182412415; 
 Wed, 14 Sep 2022 12:06:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003a62400724bsm11254wmm.0.2022.09.14.12.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 12:06:51 -0700 (PDT)
Date: Wed, 14 Sep 2022 20:06:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 12/14] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Message-ID: <YyImSUYjClqreKoI@work-vm>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-13-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-13-lvivier@redhat.com>
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
> To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
> socket_parse(), by default socket_parse() use tcp when no prefix is
> provided (format is host:port).
> 
> In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
> because it makes a vsock address look like an inet address with CID
> misinterpreted as host.
> Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Yeh I think that's safer than the last version for migrate URIs

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  util/qemu-sockets.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 9f6f655fd526..a9926af714c4 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
>      case SOCKET_ADDRESS_TYPE_FD:
>          return g_strdup_printf("fd:%s", addr->u.fd.str);
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> -        return g_strdup_printf("tcp:%s:%s",
> +        return g_strdup_printf("vsock:%s:%s",
>                                 addr->u.vsock.cid,
>                                 addr->u.vsock.port);
>      default:
> @@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
>          if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
>              goto fail;
>          }
> +    } else if (strstart(str, "tcp:", NULL)) {
> +        addr->type = SOCKET_ADDRESS_TYPE_INET;
> +        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
> +            goto fail;
> +        }
>      } else {
>          addr->type = SOCKET_ADDRESS_TYPE_INET;
>          if (inet_parse(&addr->u.inet, str, errp)) {
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


