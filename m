Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D271A3ACF8F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:56:54 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGrV-0006NZ-T2
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luGqJ-0004jm-Gz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luGqH-0000bs-7V
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624031735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XI3qtlleoXaHp6KjT2AvQ/z8PN2GyPKjtRoy11sR0Ew=;
 b=cxN6Z348SaOw/OCfLeQTRzpGaPXahCp0VzXVKnlUeRuXsb2FnZOW9udvaYFrgL3wEAPM4Z
 RbDsBhy3l2/F0ApDUkR9VXVc1Q2M4kDi71m5zhJKNqmHbsGk9KEfMwc4f3mgQt0f7UKt+5
 PdT8wpWH4+d3ks7hOwkzsZB40/prkMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-w2uxkal2PPqO6u1BqQvZtA-1; Fri, 18 Jun 2021 11:55:32 -0400
X-MC-Unique: w2uxkal2PPqO6u1BqQvZtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0781100C664;
 Fri, 18 Jun 2021 15:55:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-75.phx2.redhat.com [10.3.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 325E660BE5;
 Fri, 18 Jun 2021 15:55:30 +0000 (UTC)
Date: Fri, 18 Jun 2021 10:55:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PULL 28/34] nbd/client-connection: return only one io channel
Message-ID: <20210618155529.zns2iba7j6prpzmc@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
 <20210615204756.281505-29-eblake@redhat.com>
 <4a756fb6-fb78-7420-482d-a529480bb3f2@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <4a756fb6-fb78-7420-482d-a529480bb3f2@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:32:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Logic is wrong and uninitialized use of ioc really possible, as Peter (and clang) reports.
> 
> So, I propose the following squash-in. It doesn't conflict with following patches.
> 
> squash-in:
> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 500b8591e8..396d7f17f0 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -275,7 +275,6 @@ QIOChannel *coroutine_fn
>  nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>                              Error **errp)
>  {
> -    QIOChannel *ioc;
>      QemuThread thread;
>      if (conn->do_negotiation) {
> @@ -293,17 +292,19 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>              if (conn->sioc) {
>                  /* Previous attempt finally succeeded in background */
>                  if (conn->do_negotiation) {
> -                    ioc = g_steal_pointer(&conn->ioc);
>                      memcpy(info, &conn->updated_info, sizeof(*info));
> +                    if (conn->ioc) {
> +                        /* TLS channel now has own reference to parent */
> +                        object_unref(OBJECT(conn->sioc));
> +                        conn->sioc = NULL;
> +
> +                        return g_steal_pointer(&conn->ioc);
> +                    }
>                  }
> -                if (ioc) {
> -                    /* TLS channel now has own reference to parent */
> -                    object_unref(OBJECT(conn->sioc));
> -                } else {
> -                    ioc = QIO_CHANNEL(conn->sioc);
> -                }
> -                conn->sioc = NULL;
> -                return ioc;
> +
> +                assert(!conn->ioc);
> +
> +                return QIO_CHANNEL(g_steal_pointer(&conn->sioc));

Reviewed-by: Eric Blake <eblake@redhat.com>

I'll squash this in and send v2 of the pull request

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


