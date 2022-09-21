Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F25C018A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:29:40 +0200 (CEST)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1fP-000398-Fi
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob1Du-0007r9-92
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob1Dr-0006MB-FI
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663772470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LIM0yXWxQsYd2mL73AOKP+yC6L7/yJIHPzgaS05c6g=;
 b=Zu3/LCnkK8Fv2wnt6gp+wW5w0sQB1FhDPiZ9n7ItFh0VloKQ6Rk9bX/+2TEojYlc+Q5y3j
 yaQ3HSghXkhbr8Hk6qYFYFZ82bghtghBnrUu65Ut0zn1G6NQr6WhFcmE52/LAvkOoqCV1e
 oCLAE/1Gu495NNWJpKvPZFKB+wSI8Gg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-EZxPsAQgNpWcqL9RKSNTrQ-1; Wed, 21 Sep 2022 11:01:06 -0400
X-MC-Unique: EZxPsAQgNpWcqL9RKSNTrQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DCC7296A60F;
 Wed, 21 Sep 2022 15:01:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24065492B0A;
 Wed, 21 Sep 2022 15:01:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A32E21E6900; Wed, 21 Sep 2022 17:01:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Gregory Kurz <gregory.kurz@free.fr>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Thomas
 Huth <thuth@redhat.com>,  David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 12/14] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-13-lvivier@redhat.com>
Date: Wed, 21 Sep 2022 17:01:04 +0200
In-Reply-To: <20220913064000.79353-13-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 13 Sep 2022 08:39:58 +0200")
Message-ID: <87illgai1b.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Laurent Vivier <lvivier@redhat.com> writes:

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

I'd be tempted to split this patch, but I'm a compulsive patch splitter
;)

Reviewed-by: Markus Armbruster <armbru@redhat.com>


