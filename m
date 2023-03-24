Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0DD6C861B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfnKd-00051D-CO; Fri, 24 Mar 2023 15:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfnKW-0004yu-9I
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfnKU-0005Zt-1Z
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679687040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7y/03GzQ2JOAMwmGyxsxqowfltOtxuLlwkinj4/ijXg=;
 b=Fywo/XBqHA2Kb8OUe1vb4dAqMdy57+eYDmDsXIlCbC7NR3HQhlDix18tAqWefXyIJdkmCY
 KUpCgHOY2RMq8JGLzMbgiK7KBJC8Cmzi+kzLaHHsH8ycH2z2cHEPrvvGkyPf1B3xgVtdEo
 QDqeQnY4XHAEFaPxDXndk2C+Sf4mQDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-XG4u7dX4P72XdT4EP6OyPg-1; Fri, 24 Mar 2023 15:43:55 -0400
X-MC-Unique: XG4u7dX4P72XdT4EP6OyPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C40E1185A790;
 Fri, 24 Mar 2023 19:43:54 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0B38C15BA0;
 Fri, 24 Mar 2023 19:43:53 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:43:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Florian Westphal <fw@strlen.de>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] nbd/server: push pending frames after sending reply
Message-ID: <jibqaob3se74licelfw34lu275w47lwx6bih4nlerokwqmxzj7@rihx5wxtg4od>
References: <20230324104720.2498-1-fw@strlen.de> <ZB3b4gw6FZHWvNz9@redhat.com>
 <20230324182017.GB1871@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324182017.GB1871@breakpoint.cc>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 24, 2023 at 07:20:17PM +0100, Florian Westphal wrote:
> Kevin Wolf <kwolf@redhat.com> wrote:
> > Am 24.03.2023 um 11:47 hat Florian Westphal geschrieben:
> > > +    qio_channel_set_cork(client->ioc, true);
> > > +
> > >      if (ret < 0) {
> > >          /* It wasn't -EIO, so, according to nbd_co_receive_request()
> > >           * semantics, we should return the error to the client. */
> > > @@ -2692,6 +2694,7 @@ static coroutine_fn void nbd_trip(void *opaque)
> > >          goto disconnect;
> > >      }
> > >  
> > > +    qio_channel_set_cork(client->ioc, false);
> > >  done:
> > >      nbd_request_put(req);
> > >      nbd_client_put(client);
> > 
> > In the error paths, we never call set_cork(false) again. I suppose the
> > reason that this is okay is because the next thing is actually that we
> > close the socket?
> 
> Yes, no need to uncork before close.

Uncorking may let the close be cleaner (especially in TLS, it is nicer
to let the connection send the necessary handshaking that the
connection is intentionally going down, rather than being abruptly
ripped out by a man-in-the-middle attacker), but NBD already has to
gracefully handle abrupt connection teardown, so we aren't losing
anything if the cork delays the close or if corked data that would
have given a clean shutdown is lost.

If we teach qio_channel to honor MSG_MORE as a way to do auto-corking
without explicit cork/uncork calls, that may take care of itself.  But
that's a bigger project, while this patch seems safe enough as-is.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


