Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3836402FE4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 22:48:46 +0200 (CEST)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNi1N-0006Yt-Hh
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 16:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNhyp-0004Tb-W8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 16:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNhyo-0005yl-1t
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 16:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631047562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=welF9xxgNQtM1sSEu7qAYps/5P+z51k3IJfDYRx5MDg=;
 b=JRukQNSNWz/v8gusF5xqI8htaSm+Ho5CBsQD0g1oJvqFKFKeXXeEnL5VAi8W5wB4HpR15h
 u7J4QrnvphlX/dGOIm3qZJzvXOGOxuQA8+JPIXXRSVB4fMF8DloDBQkVSaMFtZl3tAGwFL
 oNhh3peAOU82gz3RiX+6t+yxDpZnOFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Gb1vXTudOPG0XEW33rzTJA-1; Tue, 07 Sep 2021 16:46:01 -0400
X-MC-Unique: Gb1vXTudOPG0XEW33rzTJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE1C084A5E7;
 Tue,  7 Sep 2021 20:45:59 +0000 (UTC)
Received: from redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B60E1B46B;
 Tue,  7 Sep 2021 20:45:59 +0000 (UTC)
Date: Tue, 7 Sep 2021 15:45:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 5/9] nbd/client-connection: improve error message of
 cancelled attempt
Message-ID: <20210907204557.xjmzg4xme7e2p4ws@redhat.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-6-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210906190654.183421-6-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 06, 2021 at 10:06:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  nbd/client-connection.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 722998c985..2bda42641d 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -351,8 +351,15 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>              if (conn->err) {
>                  error_propagate(errp, error_copy(conn->err));
>              } else {
> -                error_setg(errp,
> -                           "Connection attempt cancelled by other operation");
> +                /*
> +                 * The only possible case here is cancelling by open_timer
> +                 * during nbd_open(). So, the error message is for that case.
> +                 * If we have more use cases, we can refactor
> +                 * nbd_co_establish_connection_cancel() to take an additional
> +                 * parameter cancel_reason, that would be passed than to the
> +                 * caller of cancelled nbd_co_establish_connection().
> +                 */
> +                error_setg(errp, "Connection attempt cancelled by timeout");
>              }
>  
>              return NULL;
> -- 
> 2.29.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


