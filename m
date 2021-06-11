Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1302E3A42F7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:23:53 +0200 (CEST)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrh8Z-0000Uq-TU
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrh7Z-00088f-AT
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrh7X-0005YQ-Rh
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623417767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qi5dc5KFS8BUOLixsiBkmvkTvLJ+N+KMUtqG/j3nGbA=;
 b=OZ+bLufpGOUkaPCGmX+M8lHIit+A20LZVquWZO1CLfkrmRmF/MnnF0EHPfwjDw3YbWg7ht
 3Wuck/u13UmNZL7wTdzmH71rKo6cQiHbriuwCdTDf5u8iZI2Xe+bYP5s12OIuJuoyYKP9n
 Jjxm6KO1KzR3Uovs3m7tRoIt0k5S+N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-5hjJISJGM-axblRvr7Tmmw-1; Fri, 11 Jun 2021 09:22:35 -0400
X-MC-Unique: 5hjJISJGM-axblRvr7Tmmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D8DB800D62;
 Fri, 11 Jun 2021 13:22:34 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1B45D9C6;
 Fri, 11 Jun 2021 13:22:29 +0000 (UTC)
Date: Fri, 11 Jun 2021 08:22:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 05/32] qemu-sockets: introduce
 socket_address_parse_named_fd()
Message-ID: <20210611132228.k34szri6lv6c46m2@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-6-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610100802.5888-6-vsementsov@virtuozzo.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 01:07:35PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add function that transforms named fd inside SocketAddress structure
> into number representation. This way it may be then used in a context
> where current monitor is not available.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/sockets.h | 14 ++++++++++++++
>  util/qemu-sockets.c    | 19 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 7d1f813576..1f4f18a44a 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -111,4 +111,18 @@ SocketAddress *socket_remote_address(int fd, Error **errp);
>   */
>  SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
>  
> +/**
> + * socket_address_parse_named_fd:
> + *
> + * Modify @addr, replacing named fd by corresponding number.
> + *
> + * Parsing named fd (by sockget_get_fd) is not possible in context where
> + * current monitor is not available. So, SocketAddress user may first call
> + * socket_parse_named_fd() to parse named fd in advance, and then pass @addr to
> + * the context where monitor is not available.

2 different wrong function names, and reads awkwardly.  How about this
shorter variant:

Modify @addr, replacing a named fd by its corresponding number.
Needed for callers that plan to pass @addr to a context where the
current monitor is not available.

> + *
> + * Return 0 on success.
> + */
> +int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
> +
>  #endif /* QEMU_SOCKETS_H */
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c

But the code looks good.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


