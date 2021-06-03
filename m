Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E039AC69
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:13:00 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loueB-000617-Mf
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loucq-0004aa-Lo
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loucp-0005Uu-7A
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622754694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZqnwCNijcPhWN5k5PJDQ8k4nXcOjuAQUDSAMA69SrI=;
 b=QLjicKT3TxEyVwLqL4Ntgb49/iB3XKKmmI0BFI/yhR2nu1dh54TITEwpvdTYYUHmM+25rG
 O0F7fZqlbKlrcnsWTPuAfd8jtU0ln3jQEvG4PLEC4taAVAwjSOVK5KZyPJvA49oUyEPRZY
 9vDDwXie8nFKbsmRyi7SdSP49XBaxEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-R7mkB7ggMMuPvMhejoXCVQ-1; Thu, 03 Jun 2021 17:11:33 -0400
X-MC-Unique: R7mkB7ggMMuPvMhejoXCVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F367100945E;
 Thu,  3 Jun 2021 21:11:32 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76B721002D71;
 Thu,  3 Jun 2021 21:11:31 +0000 (UTC)
Date: Thu, 3 Jun 2021 16:11:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 32/33] block/nbd: safer transition to receiving request
Message-ID: <20210603211129.asvngeqkvskrobzc@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-33-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-33-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:09:10AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> req->receiving is a flag of request being in one concrete yield point
> in nbd_co_do_receive_one_chunk().
> 
> Such kind of boolean flag is always better to unset before scheduling
> the coroutine, to avoid double scheduling. So, let's be more careful.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

> @@ -614,7 +616,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
>      if (qiov) {
>          qio_channel_set_cork(s->ioc, true);
>          rc = nbd_send_request(s->ioc, request);
> -        if (nbd_clinet_connected(s) && rc >= 0) {
> +        if (nbd_client_connected(s) && rc >= 0) {

Ouch - typo fix in clinet seems unrelated in this fix; please hoist it
into the correct point in the series so that we don't have the typo in
the first place.

Otherwise,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


