Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAB3A3345
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:38:37 +0200 (CEST)
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrPZc-0006oW-5T
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrPYl-0005y2-FG
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrPYj-0006MY-9j
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623350260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzKm0Y91oeTOPoJQIapvlibpDm0kwz7ECl/Zxsn6mA4=;
 b=O65JvyW7zXvMitOvGSHuX3Sz99th5D9D+1/fnwBqAlrslpfXsyUF2DvYCDydVqWMpOBSdT
 X5XAAMgstevTiNOVsZm4eY68hnRIMhdxtAKu9MxS3Oteyjs/mdcLk4Fv6l3goX6PRaToaP
 VxtDUqRrT7J+lHIS15B+BFrulhWtxYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-r0dXE5tEMqCv0DUfsFQ0GQ-1; Thu, 10 Jun 2021 14:37:38 -0400
X-MC-Unique: r0dXE5tEMqCv0DUfsFQ0GQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07397805EE1;
 Thu, 10 Jun 2021 18:37:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F2315D9C6;
 Thu, 10 Jun 2021 18:37:37 +0000 (UTC)
Date: Thu, 10 Jun 2021 13:37:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 04/32] block/nbd: connect_thread_func(): do
 qio_channel_set_delay(false)
Message-ID: <20210610183735.oc45qq7jlws4sdzm@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610100802.5888-5-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 01:07:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> nbd_open() does it (through nbd_establish_connection()).
> Actually we lost that call on reconnect path in 1dc4718d849e1a1fe
> "block/nbd: use non-blocking connect: fix vm hang on connect()"
> when we have introduced reconnect thread.
> 
> Fixes: 1dc4718d849e1a1fe665ce5241ed79048cfa2cfc
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 01d2c2efad..f3a036354d 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -408,6 +408,8 @@ static void *connect_thread_func(void *opaque)
>          thr->sioc = NULL;
>      }
>  
> +    qio_channel_set_delay(QIO_CHANNEL(thr->sioc), false);
> +
>      qemu_mutex_lock(&thr->mutex);
>  
>      switch (thr->state) {
> -- 
> 2.29.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


