Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA839A520
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 17:56:51 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopiE-0005NP-Ti
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 11:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loph2-0003eR-8Y
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lopgz-00046V-24
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622735731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b7qU7/27IWwyDOlpWr6HBIQ6/ivj+oq2t3/5q6YUdp0=;
 b=MSbLzEc1Y99CRIPhyWPJ0ow7EHzknw+dXxfmI1BBDPIv9Oie2RyEUHpF0laODz99Cn4oRY
 QTpAf1SOhYhlHZvou1Q3LkILoxEI0OSrOwqq1SBxD9kUykbXvfISs7TiOVElVbHO6ezLuJ
 a2KsWlz5Ba5F2sZGt8Yh5bZE22kGEvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-B2oMTomHM7SRygO_jewmwA-1; Thu, 03 Jun 2021 11:55:29 -0400
X-MC-Unique: B2oMTomHM7SRygO_jewmwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A6CE1020C38;
 Thu,  3 Jun 2021 15:55:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC3D18A61;
 Thu,  3 Jun 2021 15:55:26 +0000 (UTC)
Date: Thu, 3 Jun 2021 10:55:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 14/33] nbd: move connection code from block/nbd to
 nbd/client-connection
Message-ID: <20210603155524.ihyq2pjyp7a46rvb@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-15-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-15-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Fri, Apr 16, 2021 at 11:08:52AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We now have bs-independent connection API, which consists of four
> functions:
> 
>   nbd_client_connection_new()
>   nbd_client_connection_unref()
>   nbd_co_establish_connection()
>   nbd_co_establish_connection_cancel()
> 
> Move them to a separate file together with NBDClientConnection
> structure which becomes private to the new API.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     |  11 +++
>  block/nbd.c             | 187 -----------------------------------
>  nbd/client-connection.c | 212 ++++++++++++++++++++++++++++++++++++++++
>  nbd/meson.build         |   1 +

> +++ b/include/block/nbd.h
> @@ -406,4 +406,15 @@ const char *nbd_info_lookup(uint16_t info);
>  const char *nbd_cmd_lookup(uint16_t info);
>  const char *nbd_err_lookup(int err);
>  
> +/* nbd/client-connection.c */
> +typedef struct NBDClientConnection NBDClientConnection;
> +
> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
> +void nbd_client_connection_release(NBDClientConnection *conn);
> +
> +QIOChannelSocket *coroutine_fn
> +nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);

To me, the placement of coroutine_fn looks a bit odd here, like it is
the name of a pointer declaration.  But I see that we have precedence
for doing it that way (such as block.c:bdrv_co_enter()); the
difference being that none of the other locations split the return
type on one line and the function name on another.  I don't really
have any changes to suggest, though, so I'm fine keeping it the way
you wrote.

> +++ b/nbd/client-connection.c

There may be fallout in v4 based on what you tweak in the code that
got moved here, but the split to a new file looks sane to me.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


