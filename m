Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3411CE1A5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 19:25:51 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYCBa-0003iR-Mn
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 13:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jYCAP-0002eQ-PQ
 for qemu-devel@nongnu.org; Mon, 11 May 2020 13:24:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51373
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jYCAO-0005QJ-Ts
 for qemu-devel@nongnu.org; Mon, 11 May 2020 13:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589217876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wjGhb6BbAOG8i3SkIYJGRliPy+C5MraeK7J+y0k5RrA=;
 b=iT+JIGLMBS5bG6kUeeEUj7kKT9mYd3qrBcLjm6t5yLqaM8ug+822ilDV/kUALFmsOVllSs
 JWL3kXfv8nCqpJJ5vDtEQD883yOfKZ0//GhRcZUEXf2872DMOvIquPPiG7Mi+x53wKchzo
 R2D5FdJ9tM0KN9tUavifXiDp8zRDyzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-YqaUnV3RMnO-HRJqS9tCTw-1; Mon, 11 May 2020 13:24:31 -0400
X-MC-Unique: YqaUnV3RMnO-HRJqS9tCTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44ED9802EAD;
 Mon, 11 May 2020 17:24:30 +0000 (UTC)
Received: from work-vm (ovpn-114-150.ams2.redhat.com [10.36.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9659A100164D;
 Mon, 11 May 2020 17:24:25 +0000 (UTC)
Date: Mon, 11 May 2020 18:24:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH 3/5] block/nbd.c: Add yank feature
Message-ID: <20200511172423.GK2811@work-vm>
References: <cover.1589193717.git.lukasstraub2@web.de>
 <1e712fa7f08e4772c2a68197a851161bee51610f.1589193717.git.lukasstraub2@web.de>
 <20200511161909.GJ2811@work-vm> <20200511190524.3681e58c@luklap>
MIME-Version: 1.0
In-Reply-To: <20200511190524.3681e58c@luklap>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 00:05:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Lukas Straub (lukasstraub2@web.de) wrote:
> On Mon, 11 May 2020 17:19:09 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Lukas Straub (lukasstraub2@web.de) wrote:
> > > Add yank option, pass it to the socket-channel and register a yank
> > > function which sets s->state = NBD_CLIENT_QUIT. This is the same
> > > behaviour as if an error occured.
> > > 
> > > Signed-off-by: Lukas Straub <lukasstraub2@web.de>  
> > 
> > > +static void nbd_yank(void *opaque)
> > > +{
> > > +    BlockDriverState *bs = opaque;
> > > +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> > > +
> > > +    atomic_set(&s->state, NBD_CLIENT_QUIT);  
> > 
> > I think I was expecting a shutdown on the socket here - why doesn't it
> > have one?
> 
> For nbd, we register two yank functions: This one and we enable the yank feature on the qio channel (see function nbd_establish_connection below).

Oh I see; yeh that still surprises me a little; I'd expected one yank
per item.

Dave

> Regards,
> Lukas Straub
> 
> > Dave
> > 
> > > +}
> > > +
> > >  static void nbd_client_close(BlockDriverState *bs)
> > >  {
> > >      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> > > @@ -1407,14 +1421,17 @@ static void nbd_client_close(BlockDriverState *bs)
> > >      nbd_teardown_connection(bs);
> > >  }
> > >  
> > > -static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
> > > +static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
> > > +                                                  SocketAddress *saddr,
> > >                                                    Error **errp)
> > >  {
> > > +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> > >      QIOChannelSocket *sioc;
> > >      Error *local_err = NULL;
> > >  
> > >      sioc = qio_channel_socket_new();
> > >      qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
> > > +    qio_channel_set_yank(QIO_CHANNEL(sioc), s->yank);
> > >  
> > >      qio_channel_socket_connect_sync(sioc, saddr, &local_err);
> > >      if (local_err) {
> > > @@ -1438,7 +1455,7 @@ static int nbd_client_connect(BlockDriverState *bs, Error **errp)
> > >       * establish TCP connection, return error if it fails
> > >       * TODO: Configurable retry-until-timeout behaviour.
> > >       */
> > > -    QIOChannelSocket *sioc = nbd_establish_connection(s->saddr, errp);
> > > +    QIOChannelSocket *sioc = nbd_establish_connection(bs, s->saddr, errp);
> > >  
> > >      if (!sioc) {
> > >          return -ECONNREFUSED;
> > > @@ -1829,6 +1846,12 @@ static QemuOptsList nbd_runtime_opts = {
> > >                      "future requests before a successful reconnect will "
> > >                      "immediately fail. Default 0",
> > >          },
> > > +        {
> > > +            .name = "yank",
> > > +            .type = QEMU_OPT_BOOL,
> > > +            .help = "Forcibly close the connection and don't attempt to "
> > > +                    "reconnect when the 'yank' qmp command is executed.",
> > > +        },
> > >          { /* end of list */ }
> > >      },
> > >  };
> > > @@ -1888,6 +1911,8 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
> > >  
> > >      s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
> > >  
> > > +    s->yank = qemu_opt_get_bool(opts, "yank", false);
> > > +
> > >      ret = 0;
> > >  
> > >   error:
> > > @@ -1921,6 +1946,10 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
> > >      /* successfully connected */
> > >      s->state = NBD_CLIENT_CONNECTED;
> > >  
> > > +    if (s->yank) {
> > > +        yank_register_function(nbd_yank, bs);
> > > +    }
> > > +
> > >      s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
> > >      bdrv_inc_in_flight(bs);
> > >      aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
> > > @@ -1972,6 +2001,11 @@ static void nbd_close(BlockDriverState *bs)
> > >      BDRVNBDState *s = bs->opaque;
> > >  
> > >      nbd_client_close(bs);
> > > +
> > > +    if (s->yank) {
> > > +        yank_unregister_function(nbd_yank, bs);
> > > +    }
> > > +
> > >      nbd_clear_bdrvstate(s);
> > >  }
> > >  
> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > index 943df1926a..1c1578160e 100644
> > > --- a/qapi/block-core.json
> > > +++ b/qapi/block-core.json
> > > @@ -3862,6 +3862,8 @@
> > >  #                   reconnect. After that time, any delayed requests and all
> > >  #                   future requests before a successful reconnect will
> > >  #                   immediately fail. Default 0 (Since 4.2)
> > > +# @yank: Forcibly close the connection and don't attempt to reconnect when
> > > +#        the 'yank' qmp command is executed. (Since: 5.1)
> > >  #
> > >  # Since: 2.9
> > >  ##
> > > @@ -3870,7 +3872,8 @@
> > >              '*export': 'str',
> > >              '*tls-creds': 'str',
> > >              '*x-dirty-bitmap': 'str',
> > > -            '*reconnect-delay': 'uint32' } }
> > > +            '*reconnect-delay': 'uint32',
> > > +	    'yank': 'bool' } }
> > >  
> > >  ##
> > >  # @BlockdevOptionsRaw:
> > > -- 
> > > 2.20.1
> > >   
> > 
> > 
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> 


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


