Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32C39AB7F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:05:59 +0200 (CEST)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lotbK-0002Y5-26
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lotaM-0001eb-9v
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lotaK-0005Dk-OP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622750696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFzc+2/8JKlNI+rmR1Fvmrd/auM0sa+FBtHKpOWVw1w=;
 b=MS88apcC0DXltRmdKs+iuyj1w5z/Dtf74rmKZtnMJxs3hgVcmpH3kTVY5ypvTxgInrb4+A
 ArBhYAeaRN7BFc7foicT6rPAeQ2kg8jf3Vmb6ec3EJ4mOyA+hj7Tkb1zHF1FqgZgRIqpv9
 TESXGT8PrfeJ/VF2Jty/M6EBJuN+ELo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Jn01isBvOzS_M6xlijT9Rg-1; Thu, 03 Jun 2021 16:04:54 -0400
X-MC-Unique: Jn01isBvOzS_M6xlijT9Rg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA19107ACC7;
 Thu,  3 Jun 2021 20:04:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFAAA100238C;
 Thu,  3 Jun 2021 20:04:51 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:04:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 27/33] block/nbd: split nbd_co_do_establish_connection
 out of nbd_reconnect_attempt
Message-ID: <20210603200450.permqm7dcbw5oylf@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-28-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-28-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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

On Fri, Apr 16, 2021 at 11:09:05AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Split out part, that we want to reuse for nbd_open().

Split out the part that we want to reuse for nbd_open().

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 79 +++++++++++++++++++++++++++--------------------------
>  1 file changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 15b5921725..59971bfba8 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -361,11 +361,49 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
>      return 0;
>  }
>  
> -static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
> +static int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)

Given the _co_ in the name, don't you need a coroutine_fn marker?

Otherwise looks sane.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


