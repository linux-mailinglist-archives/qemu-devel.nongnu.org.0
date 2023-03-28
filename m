Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBAE6CB2D1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 02:33:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgxG8-0002qn-GJ; Mon, 27 Mar 2023 20:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pgxG4-0002os-4e
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 20:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pgxG2-0006RP-4M
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 20:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679963532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bY6wOUid2am6m0Dfnbm5gHeB4W6W64FoizjXJ+D7P/0=;
 b=GbiAZ8mKk2w0c6IrgcYAPlY/fVvMgmoT2lPO9165u/G0H2bLnK5JGE7bTyCeT9BAt0NPZK
 X+U4nYUC1VnTBdAeteeNwCSTr/vB7wf/qZkHSOJ4OovkTWQGK0XkWBu5okyEDxeTTKNllw
 BT4afBVNhbqy0gl7fo29GSP73Zn2CkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-MkEy5dVSO9OS6DzBzO-Sxg-1; Mon, 27 Mar 2023 20:32:11 -0400
X-MC-Unique: MkEy5dVSO9OS6DzBzO-Sxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2FEA8028B3;
 Tue, 28 Mar 2023 00:32:10 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F200492C3E;
 Tue, 28 Mar 2023 00:32:10 +0000 (UTC)
Date: Mon, 27 Mar 2023 19:32:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Florian Westphal <fw@strlen.de>
Cc: qemu-devel@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH for-8.0] nbd/server: Request TCP_NODELAY
Message-ID: <bu3qv5ni7v4vgjwqcseug5cvryh7obxbrd3zpogcsj6cd5dinq@ktu7tucbizjx>
References: <20230327192947.1324372-1-eblake@redhat.com>
 <20230327224259.GA25361@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327224259.GA25361@breakpoint.cc>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Tue, Mar 28, 2023 at 12:42:59AM +0200, Florian Westphal wrote:
> Eric Blake <eblake@redhat.com> wrote:
> > Nagle's algorithm adds latency in order to reduce network packet
> > overhead on small packets.  But when we are already using corking to
> > merge smaller packets into transactional requests, the extra delay
> > from TCP defaults just gets in the way.
> > 
> > For reference, qemu as an NBD client already requests TCP_NODELAY (see
> > nbd_connect() in nbd/client-connection.c); as does libnbd as a client
> > [1], and nbdkit as a server [2].
> > 
> > [1] https://gitlab.com/nbdkit/libnbd/-/blob/a48a1142/generator/states-connect.c#L39
> > [2] https://gitlab.com/nbdkit/nbdkit/-/blob/45b72f5b/server/sockets.c#L430
> > 
> > CC: Florian Westphal <fw@strlen.de>
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  nbd/server.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/nbd/server.c b/nbd/server.c
> > index a4750e41880..976223860bf 100644
> > --- a/nbd/server.c
> > +++ b/nbd/server.c
> > @@ -2755,6 +2755,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
> >      }
> >      client->tlsauthz = g_strdup(tlsauthz);
> >      client->sioc = sioc;
> > +    qio_channel_set_delay(QIO_CHANNEL(cioc), false);
> 
> ../nbd/server.c: In function 'nbd_client_new':
> ../nbd/server.c:2763:39: error: 'cioc' undeclared (first use in this function); did you mean 'sioc'?
> 
> Other than that this looks good to me.

Arrgh. Bitten by hitting send before saving the edits in my buffer.
Yes, the obvious fix is needed and intended.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


