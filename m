Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4410C402DEE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:47:41 +0200 (CEST)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfC8-0001H1-BI
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNf9d-0007Jb-M9
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:45:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNf9a-0003dR-FZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631036701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVODojG78yb9Ltiqo0u8My8MDkgfkkvlm2C5pETFoiQ=;
 b=VScWSbgxbb65Y+4NukUJAt8b7rUMMsWsGBO6mIsf9SgIgLHJKEpuAtFLZrCAOOlFKoKfPx
 I38YToVjR1TaTcaq5fP2n25iBGDMb+eGiO1lOqdF2KZradhMQ8q3lPClfy8MtN1H9ejx66
 goFmQUqj/lLxQr84aQGkvJMPD3Y8nX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-j2ZCKQjjOuSL6IW4cL4hNA-1; Tue, 07 Sep 2021 13:44:57 -0400
X-MC-Unique: j2ZCKQjjOuSL6IW4cL4hNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A7A4501E0;
 Tue,  7 Sep 2021 17:44:56 +0000 (UTC)
Received: from redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD2B60CD1;
 Tue,  7 Sep 2021 17:44:55 +0000 (UTC)
Date: Tue, 7 Sep 2021 12:44:53 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 1/9] nbd/client-connection:
 nbd_co_establish_connection(): fix non set errp
Message-ID: <20210907174453.vyzq6f5xgcrg6qdk@redhat.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210906190654.183421-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 armbru@redhat.com, hreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 10:06:46PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> When we don't have a connection and blocking is false, we return NULL
> but don't set errp. That's wrong.

Oops...

> 
> We have two paths for calling nbd_co_establish_connection():
> 
> 1. nbd_open() -> nbd_do_establish_connection() -> ...
>   but that will never set blocking=false
> 
> 2. nbd_reconnect_attempt() -> nbd_co_do_establish_connection() -> ...
>   but that uses errp=NULL
> 
> So, we are safe with our wrong errp policy in
> nbd_co_establish_connection(). Still let's fix it.

...phew!  Thus, it's not critical to backport.

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  nbd/client-connection.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 7123b1e189..695f855754 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -318,6 +318,7 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>          }
>  
>          if (!blocking) {
> +            error_setg(errp, "No connection at the moment");
>              return NULL;
>          }
>  
> -- 
> 2.29.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


