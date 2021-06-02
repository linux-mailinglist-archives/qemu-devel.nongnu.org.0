Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4FE399554
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 23:19:39 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loYH3-00042p-Ml
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 17:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loYFz-0002vd-Ia
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loYFw-00079i-UE
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622668707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=khMubuO+XDDetnqL0qgnH0KOTYy4v72ogaY3YSM5E9c=;
 b=feDPILhiFXuUGDVo1vONBhtji9jk0uY9ObdFCFomEYpy5MRU4VkVCDSE+/Rbc0vr2XhFnu
 A16+xQf8Zu1wtpP2fPxW9EKfrEbfL1oUxWvyfN1UwVS8f3n60I9RzzlK3WNr4MWeyumkZm
 MwG3CZhkTcr0AEastcR7igYKcW0eOA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-jtaSUdphPDehqJgIt0RrNg-1; Wed, 02 Jun 2021 17:18:21 -0400
X-MC-Unique: jtaSUdphPDehqJgIt0RrNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BFFC10082E2;
 Wed,  2 Jun 2021 21:18:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 743B619D9B;
 Wed,  2 Jun 2021 21:18:19 +0000 (UTC)
Date: Wed, 2 Jun 2021 16:18:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 10/33] block/nbd: make
 nbd_co_establish_connection_cancel() bs-independent
Message-ID: <20210602211817.57mtov4ymonmuqz2@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-11-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Fri, Apr 16, 2021 at 11:08:48AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> nbd_co_establish_connection_cancel() actually needs only pointer to
> NBDConnectThread. So, make it clean.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  block/nbd.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index dd97ea0916..dab73bdf3b 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c

>  /*
>   * nbd_co_establish_connection_cancel
> - * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
> - * allow drained section to begin.
> + * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
> + * stop the thread itself neither close the socket. It just safely wakes
> + * nbd_co_establish_connection() sleeping in the yield().

Grammar suggestion:

Note that this function neither directly stops the thread nor closes
the socket, but rather safely wakes nbd_co_establish_connection()
which is sleeping in yield(), triggering subsequent cleanup there.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


