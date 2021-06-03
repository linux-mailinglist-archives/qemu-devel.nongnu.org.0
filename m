Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6539ABF6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:49:29 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1louHQ-0006zD-O9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1louGi-0006CH-0L
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1louGg-0005k0-7Z
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622753321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qsquyz8dQumVSza63x6HO6N08vMtN7+iJYNAR/ejjrg=;
 b=eJWl7jON/dtq5PzjBOAW0R453do4bdkIOxTC7R60ZberCTuZAOgkLjekYaL2DcCtiKv9Fs
 LZxxtJlfUlbFcicf42JTi88PUP4ydQRh7l+D2+9kEQ8hLdQP6ZT1z7gCEYZkWTFv22ZD5a
 97LKIIav956xoTyxkcGbsk/bfi+N+9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-6xjeJH5DMKuKpLqXGwpafg-1; Thu, 03 Jun 2021 16:48:38 -0400
X-MC-Unique: 6xjeJH5DMKuKpLqXGwpafg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A7E31854E21;
 Thu,  3 Jun 2021 20:48:37 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 596F018E53;
 Thu,  3 Jun 2021 20:48:36 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:48:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 28/33] nbd/client-connection: do
 qio_channel_set_delay(false)
Message-ID: <20210603204834.ecskt6s22hgwwwo2@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-29-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-29-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:09:06AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> nbd_open() does it (through nbd_establish_connection()).
> Actually we lost that call on reconnect path in 1dc4718d849e1a1fe
> "block/nbd: use non-blocking connect: fix vm hang on connect()"
> when we have introduced reconnect thread.

s/have introduced/introduced the/

> 
> Fixes: 1dc4718d849e1a1fe665ce5241ed79048cfa2cfc
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  nbd/client-connection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 36d2c7c693..00efff293f 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -126,6 +126,8 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>          return ret;
>      }
>  
> +    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
> +
>      if (!info) {
>          return 0;
>      }

Reviewed-by: Eric Blake <eblake@redhat.com>

Is this bug fix something that can be cherry-picked in isolation, or
does it depend too much on the rest of the series?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


